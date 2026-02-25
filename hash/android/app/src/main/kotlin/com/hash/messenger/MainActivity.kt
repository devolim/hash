package com.hash.messenger

import android.content.ComponentName
import android.content.Context
import android.content.pm.PackageManager
import android.media.AudioManager
import android.os.SystemClock
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.hash.app/system"
    private val PRIVACY_CHANNEL = "com.hash.app/privacy_screen"
    private val AUDIO_CHANNEL = "com.hash.app/audio"
    private val APP_ICON_CHANNEL = "com.hash.app/app_icon"

    private val iconAliases = mapOf(
        "default" to ".MainActivityDefault",
        "at" to ".MainActivityAt",
        "hbal" to ".MainActivityHbal",
        "hbell" to ".MainActivityHbell",
        "cloud" to ".MainActivityCloud",
        "fog" to ".MainActivityFog",
        "ghost" to ".MainActivityGhost",
        "glass" to ".MainActivityGlass",
        "key" to ".MainActivityKey",
        "lock" to ".MainActivityLock",
        "hmsg" to ".MainActivityHmsg",
        "vash" to ".MainActivityVash",
        "pyramid" to ".MainActivityPyramid",
        "rocket" to ".MainActivityRocket",
        "sun" to ".MainActivitySun",
    )

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getElapsedRealtime" -> {
                    // SystemClock.elapsedRealtime() returns milliseconds since boot
                    // This value cannot be manipulated by changing system time
                    val elapsedRealtime = SystemClock.elapsedRealtime()
                    result.success(elapsedRealtime)
                }
                "getUptimeMillis" -> {
                    // SystemClock.uptimeMillis() doesn't include deep sleep time
                    val uptimeMillis = SystemClock.uptimeMillis()
                    result.success(uptimeMillis)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, PRIVACY_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "setPrivacyScreen" -> {
                    val enabled = call.argument<Boolean>("enabled") ?: true
                    if (enabled) {
                        window.setFlags(
                            WindowManager.LayoutParams.FLAG_SECURE,
                            WindowManager.LayoutParams.FLAG_SECURE
                        )
                    } else {
                        window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
                    }
                    result.success(true)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, APP_ICON_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "setAppIcon" -> {
                    val iconId = call.argument<String>("iconId") ?: "default"
                    val targetAlias = if (iconId == "null" || iconId.isEmpty()) "default" else iconId
                    val pm = packageManager
                    val packageName = context.packageName

                    iconAliases.forEach { (key, alias) ->
                        val component = ComponentName(packageName, "$packageName$alias")
                        val newState = if (key == targetAlias)
                            PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                        else
                            PackageManager.COMPONENT_ENABLED_STATE_DISABLED

                        pm.setComponentEnabledSetting(
                            component,
                            newState,
                            PackageManager.DONT_KILL_APP
                        )
                    }
                    result.success(true)
                }
                "getAppIcon" -> {
                    val pm = packageManager
                    val packageName = context.packageName

                    var currentIcon = "default"
                    iconAliases.forEach { (key, alias) ->
                        if (key != "default") {
                            val component = ComponentName(packageName, "$packageName$alias")
                            val state = pm.getComponentEnabledSetting(component)
                            if (state == PackageManager.COMPONENT_ENABLED_STATE_ENABLED) {
                                currentIcon = key
                            }
                        }
                    }
                    result.success(currentIcon)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, AUDIO_CHANNEL).setMethodCallHandler { call, result ->
            val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
            when (call.method) {
                "setSpeakerphoneOn" -> {
                    try {
                        val enabled = call.argument<Boolean>("enabled") ?: false
                        audioManager.mode = AudioManager.MODE_IN_COMMUNICATION
                        audioManager.isSpeakerphoneOn = enabled
                        result.success(true)
                    } catch (e: Exception) {
                        result.error("AUDIO_ERROR", e.message, null)
                    }
                }
                "resetAudioMode" -> {
                    try {
                        audioManager.isSpeakerphoneOn = false
                        audioManager.mode = AudioManager.MODE_NORMAL
                        result.success(true)
                    } catch (e: Exception) {
                        result.error("AUDIO_ERROR", e.message, null)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
