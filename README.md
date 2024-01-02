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
# __manifest__.py

{
    'name': 'Gestió Alumnes',
    'version': '1.0',
    'summary': 'Mòdul per gestionar les notes dels alumnes',
    'description': """
        Aquest mòdul gestiona la informació dels alumnes i les seves notes.
    """,
    'author': 'Joan Pardo',
    'depends': ['base'],
    'data': [
        'views/alumne_views.xml',
    ],
    'installable': True,
    'application': True,
    'auto_install': False,
}

```

Contingut del fitxer ```models.py```

# models.py
```py
# models.py

from odoo import models, fields

class Alumne(models.Model):
    _name = 'gestio_alumnes.alumne'
    _description = "Informació de l'Alumne"

    name = fields.Char(string='Nom', required=True)
    notes = fields.One2many('gestio_alumnes.nota', 'alumne_id', string='Notes')

class Nota(models.Model):
    _name = 'gestio_alumnes.nota'
    _description = 'Notes de l\'Alumne'

    alumne_id = fields.Many2one('gestio_alumnes.alumne', string='Alumne', required=True)
    assignatura = fields.Char(string='Assignatura', required=True)
    puntuacio = fields.Float(string='Puntuació')
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
