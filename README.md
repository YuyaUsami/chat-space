== README
#chatspace-database

##users_table

###association
has_many :groups , through: :groups_users<br>
has_many :groups_users<br>
has_many :messages

###table_contents
|column     |type      |Constraint               |
|:---       |:---      |:---                     |
|name       |string    |null: false/unique: true |
|e-mail     |string    |null: false/unique: true |
|password   |string    |null: false/unique: true |

##messages_table

###association
belongs_to :group<br>
belongs_to :user

###table_contents
|column     |type      |Constraint |
|:---       |:---      |:---       |
|body       |text      |           |
|image      |string    |           |
|group_id   |references|foreign_key|
|user_id    |references|foreign_key|

##groups_table

###association
has_many :users , through: :groups_users<br>
has_many :groups_users<br>
has_many :messages

###table_contents
|column     |type   |Constraint              |
|:---       |:---   |:---                    |
|name       |string |null: false/unique: true|

##groups_users_table

###association
belongs_to :group<br>
belongs_to :user

###table_contents
|column     |type      |Constraint |
|:---       |:---      |:---       |
|group_id   |references|foreign_key|
|user_id    |references|foreign_key|