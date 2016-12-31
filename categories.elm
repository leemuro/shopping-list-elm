module Categories exposing (defaultCategories)

defaultCategories = [
    { name = "Produce"
    , matchers = 
        [ "asparagus", "arugula", "cabbage", "beans", "garlic", "beet", "onion", "bok choy"
        , "lettuce", "broccoli", "peas", "radish", "rhubarb", "carrot", "spinach", "cauliflower"
        , "cucumber", "chard", "spinach", "eggplant", "greens", "turnips", "watercress"
        , "endive", "escarole", "herbs", "leeks", "kale", "chive", "okra", "cilantro", "pepper"
        , "potato", "mizuna", "corn", "tomato", "watermelon", "melon", "thyme", "zucchini"
        , "squash", "rutabaga", "apple", "apricot", "avocado", "banana", "bilberry", "blackberry"
        , "blackcurrant", "blueberry", "boysenberry", "currant", "cherry", "cherimoya"
        , "cloudberry", "coconut", "cranberry", "cucumber", "damson", "date", "dragonfruit"
        , "durian", "elderberry", "feijoa", "fig", "goji", "berry", "gooseberry", "grape"
        , "raisin", "grapefruit", "guava", "honeyberry", "huckleberry", "jabuticaba", "jackfruit", "jambul"
        , "jujube", "kiwifruit", "kumquat", "lemon", "lime", "loquat", "longan", "lychee", "mango"
        , "marionberry", "melon", "cantaloupe", "honeydew", "watermelon", "fruit", "mulberry", "nectarine"
        , "nance", "orange", "clementine", "mandarine", "tangerine", "papaya", "passionfruit", "peach"
        , "pear", "persimmon", "physalis", "plantain", "plum", "prune", "pineapple", "plumcot", "pomegranate"
        , "pomelo", "quince", "raspberry", "salmonberry", "rambutan", "redcurrant", "salak", "satsuma"
        , "strawberry", "tamarillo", "tamarind", "yuzu"
        ]
    , exclusions = [ "can", "powder", "tsp", "tbsp", "frozen", "juice", "jam", "jelly", "sauce", "with green chilis" ]
    }
  , { name = "Meat"
    , matchers = 
        [ "chicken", "beef", "pork", "turkey", "meat", "duck", "goose", "quail", "carp", "catfish"
        , "salmon", "tilapia", "herring", "fish", "lobster", "shrimp", "mussels", "prawns", "oysters"
        ] 
    , exclusions = [ "can", "broth", "stock", "bouillon" ]
    }  
  , { name = "Canned/Jarred Goods"
    , matchers = [ "can", "jar", "diced tomato", "crushed tomato", "tomato sauce", "broth", "soup", "stock", "olive" ]
    , exclusions = []
    }  
  , { name = "Spices/Herbs"
    , matchers = 
        [ "allspice", "all spice", "spice", "anise", "basil", "bay leaf", "caraway", "cardamom", "cayenne", "pepper"
        , "celery seed", "chicory", "chili powder", "dill", "garlic", "chives", "cilantro", "cinnamon", "clove", "coriander"
        , "cumin", "curry", "dill", "fennel", "fenugreek", "ginger", "lavender", "marjoram", "mint", "mustard"
        , "nutmeg", "oregano", "paprika", "parsley", "rosemary", "saffron", "sage", "safflower", "tarragon"
        , "thyme", "turmeric", "vanilla", "salt", "powder"
        ] 
    , exclusions = [ "fresh" ]
    }
  , { name = "Frozen Goods"
    , matchers = [ "frozen", "freezer" ]
    , exclusions = []
    }
  , { name = "Dairy"
    , matchers = [ "egg", "milk", "cream", "cheese", "yogurt", "cheddar", "swiss", "butter", "jack", "colby" ] 
    , exclusions = []
    }  
  , { name = "Snacks"
    , matchers = [ "chips", "chocolate", "crackers" ]
    , exclusions = [] 
    }
  , { name = "Other"
    , matchers = []
    , exclusions = [] 
    }
  ]
