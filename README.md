# odoo-alumnes

Al fitxer de configuració d'Odoo, ```C:\Program files\odoo14\server\odoo.conf``` ja tinc afegida la ruta ```c:\odoo_custom_addons``` que és on vull desenvolupar el mòdul.

L'executable de Python que utilitza la meva instància d'Odoo es troba a la ruta ```C:\Program files\odoo14\python\python.exe``` i és la versió **```Python 3.7.7```**.

He creat l'estructura de fitxers del meu mòdul executant la següent ordre:
```
"C:/Program Files/Odoo 14.0.20220215/python/python.exe" "C:/Program Files/Odoo 14.0.20220215/server/odoo-bin" scaffold gestio_alumnes "C:/odoo_custom_addons"
```

I l'estructura de fitxers de la carpeta ```c:\odoo_custom_addons\``` és la següent:

```
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
```

Ja he reiniciat el servei d'Odoo, he actualitzat la llista d'aplicacions, m'ha aparegut l'aplicació ```gestio_alumnes``` i l'he instal·lada sense problemes.

Pas 1: Definir el Model de Dades

Al fitxer ```models.py```, definim els **models** que representaran les entitats de la nostra aplicació. Afegirem  les classes necessaries per representar **Alumnes**, **Mòduls Professionals**, **Unitats Formatives** i **Notes**.

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
Pas 2: Crear Vistes

Al fitxer views.xml, defineix les vistes que mostraran la informació al frontend. Pots utilitzar el codi següent com a punt de partida:

```xml
<!-- views.xml -->

<odoo>
    <data>

        <!-- Vista per al formulari d'Alumnes -->
        <record id="alumnes_form_view" model="ir.ui.view">
            <field name="name">alumnes.form</field>
            <field name="model">gestio_alumnes.alumnes</field>
            <field name="arch" type="xml">
                <form>
                    <sheet>
                        <!-- Defineix els camps del formulari aquí -->
                        <group>
                            <field name="nom_alumne"/>
                            <field name="dni_alumne"/>
                            <!-- Afegeix els altres camps aquí -->
                        </group>
                    </sheet>
                </form>
            </field>
        </record>

        <!-- Vista per a la llista d'Alumnes -->
        <record id="alumnes_tree_view" model="ir.ui.view">
            <field name="name">alumnes.tree</field>
            <field name="model">gestio_alumnes.alumnes</field>
            <field name="arch" type="xml">
                <tree>
                    <!-- Defineix les columnes de la llista aquí -->
                    <field name="nom_alumne"/>
                    <field name="dni_alumne"/>
                    <!-- Afegeix els altres camps aquí -->
                </tree>
            </field>
        </record>

        <!-- Afegeix vistes per a Mòduls Professionals, Unitats Formatives, Notes -->

    </data>
</odoo>
```

Pas 3: Crear Accessos i Seguretat
Al fitxer ir.model.access.csv, defineix els permisos d'accés als models:

```csv
# ir.model.access.csv

id,name,model_id:id,group_id:id,perm_read,perm_write,perm_create,perm_unlink
access_gestio_alumnes_alumnes,gestio_alumnes.alumnes,model_gestio_alumnes_alumnes,base.group_user,1,1,1,1
access_gestio_alumnes_moduls_professionals,gestio_alumnes.moduls_professionals,model_gestio_alumnes_moduls_professionals,base.group_user,1,1,1,1
access_gestio_alumnes_unitats_formatives,gestio_alumnes.unitats_formatives,model_gestio_alumnes_unitats_formatives,base.group_user,1,1,1,1
access_gestio_alumnes_notes,gestio_alumnes.notes,model_gestio_alumnes_notes,base.group_user,1,1,1,1
```

Pas 4: Reiniciar i Actualitzar
Reinicieu el servidor d'Odoo.
Actualitza la llista d'aplicacions i cerca la teva aplicació "Gestió Alumnes".
Instal·la-la.

Pas 5: Explora el teu Mòdul
Accedeix a l'aplicació i explora les funcions que has creat.
Podeu afegir, editar i eliminar registres.