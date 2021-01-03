## userテーブル
  | Column   |   Type   | Option                           |
  |--------  |----------|----------------------------------|
  |   email  |  string  |not:null                          |
  |password  |  string  |not:null                          |
  | name     |  string  |not:null                          |
  | profile  |  text    |not:null                          |
  |occupation|  text    |not:null                          |
  | position |  text    |not:null                          |

### Association
    has_many :prototypes
    has_many :comments

## prototypesテーブル
  | Column   |  Type    | Option                           |
  |----------|----------|----------------------------------|
  |title     |string    |not:null                          |
  |catch_copy|text      |not:null                          |
  |concept   |text      |not:null                          |
  |image     |          |ActiveStorageで実装                |
  |user      |reference |                                  |

### Association
    belongs_to :user
    has_many   :comments

## commentテーブル
  | Column   |  Type    | Option                           |
  |----------|----------|----------------------------------|
  |text      |text      |not:null                          |
  |user      |reference |                                  |
  |prototype |reference |                                  |

### Association
    belongs_to :user
    belongs_to :prototype