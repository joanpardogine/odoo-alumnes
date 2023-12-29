# odoo-alumnes

```
mkdir gestio_alumnes

cd gestio_alumnes
```

```
__init__.py
```


__manifest__.py

# __manifest__.py

```py
{
    'name': 'Gestió alumnes',
    'version': '1.0',
    'summary': 'Mòdul per gestionar alumnes i les seves notes',
    'description': """
        Aquest mòdul serveix per gestionar els alumnes i les seves notes.
    """,
    'author': 'Joan Pardo',
    'depends': ['base'],
    'data': [
        # Aquí s'afegiran el fitxers XML per les vistes i les dades d'exemple si calen
    ],
    'installable': True,
    'application': True,
    'auto_install': False,
}
```

