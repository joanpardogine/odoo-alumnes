# odoo-alumnes


En el fichero de configuración de Odoo, "C:\Program files\odoo14\server\odoo.conf" ya tengo añadida la ruta "c:\odoo_custom_addons" que es donde quiero desarrollar el módulo.

El ejecutable de Python que utiliza mi instancia de Odoo se encuentra en la ruta "C:\Program files\odoo14\python\python.exe" y es la versión Python 3.7.7.

He creado la estructura de ficheros de mi modulo ejecutando el siguiente comando:
"C:/Program Files/Odoo 14.0.20220215/python/python.exe" "C:/Program Files/Odoo 14.0.20220215/server/odoo-bin" scaffold gestio_alumnes "C:/odoo_custom_addons"

Y la estructura de ficheros de la carpeta c:\odoo_custom_addons\ es la siguiente:

gestio_alumnes
│   __init__.py
│   __manifest__.py
│
├── controllers
│      __init__.py
│      controllers.py
│
├── demo
│       demo.xml
│
├── models
│       __init__.py
│      models.py
│
├── security
│      ir.model.access.csv
│
└── views
       template.xml
       veiws.xml

Ya he reiniciado el servicio de Odoo, he actualizado la lista de aplicaciones, me ha aparecido la aplicación gestio_alumnes y la he instalado sin problemas.



Pas 1: Definir el Model de Dades

Al fitxer models.py, definim els models que representaran les entitats de la nostra aplicació. Afegirem  les classes necessaries per representar Alumnes, Mòduls Professionals, Unitats Formatives i Notes.

Podem utilitzar el codi següent com a punt de partida:


```py
# models.py

from odoo import models, fields

class Alumnes(models.Model):
    _name = 'gestio_alumnes.alumnes'
    _description = 'Model per representar als alumnes'

    nom_alumne = fields.Char('Nom Alumne')
    dni_alumne = fields.Char('DNI Alumne')
    data_naix_alumne = fields.Date('Data Naixement Alumne')
    # Afegeix els altres camps aquí...

class ModulsProfessionals(models.Model):
    _name = 'gestio_alumnes.moduls_professionals'
    _description = 'Model per representar els mòduls professionals'

    nom_modul = fields.Char('Nom del Mòdul Professional')
    hores_totals_modul = fields.Integer('Hores Totals del Mòdul')
    # Afegeix els altres camps aquí...

class UnitatsFormatives(models.Model):
    _name = 'gestio_alumnes.unitats_formatives'
    _description = 'Model per representar les unitats formatives'

    nom_uf = fields.Char('Nom de la Unitat Formativa')
    hores_totals_uf = fields.Integer('Hores Totals de la UF')
    # Afegeix els altres camps aquí...

class Notes(models.Model):
    _name = 'gestio_alumnes.notes'
    _description = 'Model per representar les notes dels alumnes a les UF'

    alumne_id = fields.Many2one('gestio_alumnes.alumnes', 'Alumne')
    uf_id = fields.Many2one('gestio_alumnes.unitats_formatives', 'Unitat Formativa')
    nota = fields.Float('Nota')
    # Afegeix els altres camps aquí...

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