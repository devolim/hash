# Récapitulatif des langues disponibles pour le site Hash

## Langues existantes avant la mise à jour

| Langue | Code ISO | Dossier | Statut |
|--------|----------|---------|--------|
| Français (Principale) | fr | (racine) | Existant |
| Allemand | de | de/ | Existant |
| Anglais | en | en/ | Existant |
| Espagnol | es | es/ | Existant |
| Italien | it | it/ | Existant |
| Arabe | ar | ar/ | Existant |
| Chinois | zh | zh/ | Existant |
| Japonais | ja | ja/ | Existant |
| Russe | ru | ru/ | Existant |
| Coréen | ko | ko/ | Existant |
| Turc | tr | tr/ | Existant |

## Nouvelles langues ajoutées

### Anglais (variantes)
| Langue | Code ISO | Dossier | Statut |
|--------|----------|---------|--------|
| Anglais (Australie) | en-AU | en-AU/ | Nouveau |
| Anglais (Canada) | en-CA | en-CA/ | Nouveau |
| Anglais (États-Unis) | en-US | en-US/ | Nouveau |
| Anglais (Royaume-Uni) | en-GB | en-GB/ | Nouveau |

### Chinois (variantes)
| Langue | Code ISO | Dossier | Statut |
|--------|----------|---------|--------|
| Chinois (simplifié) | zh-CN | zh-CN/ | Nouveau |
| Chinois (traditionnel) | zh-TW | zh-TW/ | Nouveau |

### Espagnol (variantes)
| Langue | Code ISO | Dossier | Statut |
|--------|----------|---------|--------|
| Espagnol (Espagne) | es-ES | es-ES/ | Nouveau |
| Espagnol (Mexique) | es-MX | es-MX/ | Nouveau |

### Français (variantes)
| Langue | Code ISO | Dossier | Statut |
|--------|----------|---------|--------|
| Français (Canada) | fr-CA | fr-CA/ | Nouveau |

### Portugais (variantes)
| Langue | Code ISO | Dossier | Statut |
|--------|----------|---------|--------|
| Portugais (Brésil) | pt-BR | pt-BR/ | Nouveau |
| Portugais (Portugal) | pt-PT | pt-PT/ | Nouveau |

### Autres langues européennes
| Langue | Code ISO | Dossier | Statut |
|--------|----------|---------|--------|
| Catalan | ca | ca/ | Nouveau |
| Croate | hr | hr/ | Nouveau |
| Danois | da | da/ | Nouveau |
| Finnois | fi | fi/ | Nouveau |
| Grec | el | el/ | Nouveau |
| Hébreu | he | he/ | Nouveau |
| Hongrois | hu | hu/ | Nouveau |
| Néerlandais | nl | nl/ | Nouveau |
| Norvégien | no | no/ | Nouveau |
| Polonais | pl | pl/ | Nouveau |
| Roumain | ro | ro/ | Nouveau |
| Slovaque | sk | sk/ | Nouveau |
| Suédois | sv | sv/ | Nouveau |
| Tchèque | cs | cs/ | Nouveau |
| Ukrainien | uk | uk/ | Nouveau |

### Autres langues asiatiques
| Langue | Code ISO | Dossier | Statut |
|--------|----------|---------|--------|
| Hindi | hi | hi/ | Nouveau |
| Indonésien | id | id/ | Nouveau |
| Malais | ms | ms/ | Nouveau |
| Thaï | th | th/ | Nouveau |
| Vietnamien | vi | vi/ | Nouveau |

## Liste complète des 40 langues

1. Français (Principale) - fr - (racine)
2. Allemand - de - de/
3. Anglais (Australie) - en-AU - en-AU/
4. Anglais (Canada) - en-CA - en-CA/
5. Anglais (États-Unis) - en-US - en-US/
6. Anglais (Royaume-Uni) - en-GB - en-GB/
7. Arabe - ar - ar/
8. Catalan - ca - ca/
9. Chinois (simplifié) - zh-CN - zh-CN/
10. Chinois (traditionnel) - zh-TW - zh-TW/
11. Chinois - zh - zh/
12. Coréen - ko - ko/
13. Croate - hr - hr/
14. Danois - da - da/
15. Espagnol (Espagne) - es-ES - es-ES/
16. Espagnol (Mexique) - es-MX - es-MX/
17. Espagnol - es - es/
18. Finnois - fi - fi/
19. Français (Canada) - fr-CA - fr-CA/
20. Français - fr - (racine)
21. Grec - el - el/
22. Hébreu - he - he/
23. Hindi - hi - hi/
24. Hongrois - hu - hu/
25. Indonésien - id - id/
26. Italien - it - it/
27. Japonais - ja - ja/
28. Malais - ms - ms/
29. Néerlandais - nl - nl/
30. Norvégien - no - no/
31. Polonais - pl - pl/
32. Portugais (Brésil) - pt-BR - pt-BR/
33. Portugais (Portugal) - pt-PT - pt-PT/
34. Portugais - pt - pt/
35. Roumain - ro - ro/
36. Russe - ru - ru/
37. Slovaque - sk - sk/
38. Suédois - sv - sv/
39. Tchèque - cs - cs/
40. Thaï - th - th/
41. Turc - tr - tr/
42. Ukrainien - uk - uk/
43. Vietnamien - vi - vi/

## Structure des dossiers

Chaque dossier de langue contient les 8 pages suivantes :
- index.html
- help.html
- delete-account.html
- support.html
- terms.html
- opensource.html
- security.html
- privacy.html

## Configuration technique

### Balises HTML mises à jour

Pour chaque page dans les nouveaux dossiers :
- `<html lang="XX">` - où XX est le code de langue approprié
- `<meta property="og:locale" content="XX_YY">` - format locale
- `<link rel="canonical" href="https://hash.devolim.fr/XX/">` - URL canonique
- Balises hreflang complètes dans toutes les pages existantes

### Exemple pour en-AU/index.html
```html
<html lang="en-AU">
<meta property="og:locale" content="en_AU">
<link rel="canonical" href="https://hash.devolim.fr/en-AU/">
```

## Fichiers créés

Total : 29 nouvelles langues × 8 pages = 232 nouveaux fichiers HTML

## Fichiers modifiés

Tous les fichiers HTML existants (racine + 11 langues existantes × 8 pages) ont été mis à jour avec les nouvelles balises hreflang.
