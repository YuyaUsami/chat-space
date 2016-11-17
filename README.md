== README
#chatspace-database

##users_table

#association
has_many :groups , through: :group_users
has_many :groups_users
has_many :messages

#table_contents
|column     |type   |Constraint               |
|:---       |:---   |:---                     |
|name       |string |                         |
|e-mail     |string |null: false/unique: true |
|password   |string |null: false/unique: true |
|group_id   |integer|foreign_key              |

##messages_table

#association
belongs_to :group
belongs_to :user

#table_contents
|column     |type   |Constraint |
|:---       |:---   |:---       |
|body       |string |           |
|image      |string |           |
|group_id   |integer|foreign_key|
|user_id    |integer|foreign_key|

##groups_table

#association
has_many :users , through: :group_users
has_many :groups_users
has_many :messages

#table_contents
|column     |type   |Constraint |
|:---       |:---   |:---       |
|name       |string |           |

##group_user_table

#association
belongs_to :group
belongs_to :user

#table_contents
|column     |type   |Constraint |
|:---       |:---   |:---       |
|group_id   |integer|foreign_key|
|user_id    |integer|foreign_key|