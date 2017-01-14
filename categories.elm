module Categories exposing (defaultCategories)

defaultCategories = [
    { name = "Produce"
    , matchers = 
        [ "asparagus", "arugula", "cabbage", "bean", "beans", "garlic", "beet", "beets", "onion", "onions", "bok choy", "dill"
        , "basil", "rosemary", "lettuce", "broccoli", "pea", "peas", "radish", "radishes", "rhubarb", "carrot", "carrots"
        , "spinach", "cauliflower", "cucumber", "cucumbers", "chard", "spinach", "eggplant", "greens", "turnip", "turnips"
        , "watercress", "endive", "escarole", "herbs", "leeks", "kale", "chive", "chives", "okra", "cilantro", "pepper", "peppers"
        , "potato", "potatos", "potatoes", "mizuna", "corn", "tomato", "tomatoes", "watermelon", "watermelons", "melon", "melons"
        , "thyme", "zucchini", "zucchinis", "squash", "rutabaga", "apple", "apples", "apricot", "apricots"
        , "avocado", "avocados", "avacado", "avacados", "banana", "bananas", "bilberry", "bilberries", "blackberry", "blackberries"
        , "blackcurrant", "blueberry", "blueberries", "berries", "boysenberry", "boysenberries", "currant", "cherry", "cherries"
        , "cherimoya", "cloudberry", "cloudberries", "coconut", "coconuts", "cranberry", "cranberries", "damson", "date", "dates"
        , "dragonfruit", "dragonfruits", "durian", "elderberry", "elderberries", "feijoa", "fig", "figs", "goji", "berry", "gooseberry", "gooseberries"
        , "grape", "grapes", "raisin", "raisins", "grapefruit", "grapefruits", "guava", "honeyberry", "huckleberry", "jabuticaba", "jackfruit", "jambul"
        , "jujube", "kiwifruit", "kumquat", "lemon", "lime", "loquat", "longan", "lychee", "mango"
        , "marionberry", "melon", "melons", "cantaloupe", "cataloupes", "honeydew", "honeydews", "watermelon", "watermelons", "fruit", "fruits"
        , "mulberry", "mulberries", "nectarine", "nectarines", "nance", "orange", "oranges", "clementine", "clementines", "mandarine", "mandarins"
        , "tangerine", "tangerines", "papaya", "passionfruit", "peach", "peaches", "pear", "pears", "persimmon", "physalis", "plantain"
        , "plum", "plums", "prune", "prunes", "pineapple", "pineapples", "plumcot", "pomegranate", "pomegranates"
        , "pomelo", "quince", "raspberry", "raspberries", "salmonberry", "salmonberries", "rambutan", "redcurrant", "salak", "satsuma"
        , "strawberry", "strawberries", "tamarillo", "tamarind", "yuzu", "romaine", "celery"
        ]
    , exclusions = 
        [ "can", "cans", "dried", "dry", "powder", "tsp", "tbsp", "teaspoon", "teaspoons", "tablespoon", "tablespoons"
        , "frozen", "juice", "jam", "jelly", "sauce", "with green chilis", "ground", "dr pepper", "dr. pepper"
        , "thawed", "oil", "pop"
        ]
    }
  , { name = "Meat"
    , matchers = 
        [ "chicken", "chickens", "beef", "pork", "turkey", "turkeys", "meat", "meats", "roast", "roasts", "duck"
        , "goose", "quail", "carp", "catfish", "salmon", "tilapia", "herring", "fish", "lobster", "lobsters"
        , "shrimp", "mussel", "museels", "prawn", "prawns", "oysters"
        ] 
    , exclusions = [ "can", "cans", "broth", "stock", "bouillon" ]
    }  
  , { name = "Breads/Baked Goods"
    , matchers = 
        [ "bread", "breads", "tortilla", "tortillas", "wrap", "wraps", "pita", "pitas", "muffin", "muffins"
        , "bun", "buns", "roll", "rolls" 
        ]
    , exclusions = [ "chips", "cinnamon rolls" ]
    }
  , { name = "Canned/Jarred Goods"
    , matchers = 
        [ "can", "canned", "cans", "jar", "jarred", "jars", "diced tomato", "crushed tomato", "tomato sauce"
        , "broth", "soup", "soups", "stock", "olive", "olives"
        ]
    , exclusions = [ "oil" ]
    }  
  , { name = "Condiments"
    , matchers = [ "ketchup", "mustard", "relish", "sauce", "mayo" ]
    , exclusions = [ "tomato sauce", "pasta sauce" ]
    }
  , { name = "Spices/Herbs"
    , matchers = 
        [ "allspice", "all spice", "spice", "spices", "anise", "basil", "bay leaf", "caraway", "cardamom", "cayenne", "black pepper"
        , "teaspoon pepper", "tsp pepper", "tsp. pepper", "tablespoon pepper", "tbsp pepper", "tbsp. pepper"
        , "celery seed", "chicory", "chili powder", "garlic", "chive", "chives", "cilantro", "cinnamon", "clove", "coriander"
        , "cumin", "curry", "dill", "fennel", "fenugreek", "ginger", "lavender", "marjoram", "mint", "mustard"
        , "nutmeg", "oregano", "paprika", "parsley", "rosemary", "saffron", "sage", "safflower", "tarragon"
        , "thyme", "turmeric", "vanilla", "salt", "powder", "dried onion", "dried minced onion", "pepper to taste", "salt to taste"
        ] 
    , exclusions = []
    }
  , { name = "Frozen Goods"
    , matchers = [ "frozen", "freezer", "thawed", "ice cream" ]
    , exclusions = []
    }
  , { name = "Dairy"
    , matchers = 
        [ "egg", "eggs", "milk", "cream", "cheese", "cheeses", "yogurt", "yogurts", "cheddar"
        , "swiss", "butter", "jack", "colby", "half and half", "half & half" 
        ] 
    , exclusions = [ "shaving", "chip", "chips" ]
    }  
  , { name = "Beverages"
    , matchers = [ "pop", "soda", "sodas", "water", "waters", "juice", "tea", "coke", "sprite", "dr pepper", "drink" ]
    , exclusions = [ "poppyseed" ]
    }
  , { name = "Alcohol"
    , matchers = 
        [ "beer", "beers", "wine", "vodka", "moscato", "chardonay", "pino grigio"
        , "merlot", "vodka", "rum", "margarita", "tequila", "whisky", "whiskey", "bourbon"
        ]
    , exclusions = [ "vinegar" ]
    }
  , { name = "Other"
    , matchers = []
    , exclusions = [] 
    }
  ]
