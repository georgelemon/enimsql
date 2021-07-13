## Enimsql is a simple PostgreSQL ORM made for poets.
## Written in Nim, inspired by Illuminate Eloquent.

## Pragmas to customize `Model <model.html#Model>`_ field representation in generated table schemas.
template pk* {.pragma.}
    ##[ Mark field as primary key.
    ``id`` field is ``pk`` by default.
    ]##

template ro* {.pragma.}
    ##[ Mark field as read-only.
    Read-only fields are ignored in ``insert`` and ``update`` procs unless ``force`` is passed.
    Use for fields that are populated automatically by the DB: ids, timestamps, and so on.
    ``id`` field is ``ro`` by default.
    ]##

template unique* {.pragma.}
    ## Mark field as unique.

template fk*(val: typed) {.pragma.}
    ## Mark ``int`` field as foreign key.
    ## Foreign keys always references the field ``id`` of ``val``. ``val`` should be a Model.

template onDelete*(val: string) {.pragma.}
    ## Add ``ON DELETE {val}`` constraint to the column.


# Define Base Model object
type Model* = ref object of RootObj
    id* {.pk, ro.}: int64
    sql*: string
    TableName*: string
