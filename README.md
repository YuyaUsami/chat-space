== README
#chatspace-database

##users_table

###table_contents
|column     |type      |Constraint               |
|:---       |:---      |:---                     |
|name       |string    |null: false/unique: true |
|e-mail     |string    |null: false/unique: true |
|password   |string    |null: false/unique: true |
|group_id   |references|foreign_key              |

##messages_table

###table_contents
|column     |type      |Constraint |
|:---       |:---      |:---       |
|body       |text      |           |
|image      |string    |           |
|group_id   |references|foreign_key|
|user_id    |references|foreign_key|

##groups_table

###table_contents
|column     |type   |Constraint              |
|:---       |:---   |:---                    |
|name       |string |null: false/unique: true|

##groups_user_table

###table_contents
|column     |type      |Constraint |
|:---       |:---      |:---       |
|group_id   |references|foreign_key|
|user_id    |references|foreign_key|