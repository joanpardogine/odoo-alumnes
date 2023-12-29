# odoo-alumnes

```
mkdir gestio_alumnes

cd gestio_alumnes
```

```
__init__.py
```


Contingut del fitxer ```__manifest__.py```

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

Contingut del fitxer ```models.py```

# models.py
```py
from odoo import models, fields

class Alumne(models.Model):
    _name = 'gestio_alumnes.alumne'
    _description = 'Informació alumne'

    nom = fields.Char(string='Nom', required=True)
    notes = fields.One2many('gestio_alumnes.nota', 'codi_alumne', string='Notes')

class Nota(models.Model):
    _name = 'gestio_alumnes.nota'
    _description = 'Notes alumne'

    codi_alumne = fields.Many2one('gestio_alumnes.alumne', string='Alumne', required=True)
    unitat_formativa = fields.Char(string='Unitat Formativa', required=True)
    nota = fields.Float(string='Nota')
```

Contingut del fitxer ```__manifest__.py```

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
        'views/alumne_views.xml',  # Es crearà aquest fitxer més endavant
    ],
    'installable': True,
    'application': True,
    'auto_install': False,
}
```

```
mkdir views

cd views
```

```xml
<!-- alumne_views.xml -->

<odoo>
    <data>
        <record id="view_alumne_form" model="ir.ui.view">
            <field name="name">gestio_alumnes.alumne.form</field>
            <field name="model">gestio_alumnes.alumne</field>
            <field name="arch" type="xml">
                <form>
                    <group>
                        <field name="nom"/>
                        <field name="notes" widget="many2many_tags" options="{'no_create': True}"/>
                    </group>
                </form>
            </field>
        </record>
    </data>
</odoo>
```