import os

# Path to the images directory relative to this script
IMAGES_DIR = os.path.join(os.path.dirname(__file__), '..', 'images')

def get_available_words():
    """
    Scans the images directory and returns a set of available words (based on filenames).
    """
    words = set()
    if not os.path.exists(IMAGES_DIR):
        print(f"Warning: Images directory not found at {IMAGES_DIR}")
        return words

    for filename in os.listdir(IMAGES_DIR):
        if filename.lower().endswith(('.gif', '.png', '.jpg', '.jpeg')):
            # remove extension
            word = os.path.splitext(filename)[0].lower()
            # Handle cases like "summer-1.gif" -> maybe just "summer"?
            # For now, let's keep exact verification as per original Dart logic which had exact list
            words.add(word)
    
    return sorted(list(words))

def text_to_asl(text):
    """
    Converts text to a list of found words and missing words.
    Returns:
        {
            "found": [list of words that have images],
            "missing": [list of words that do not],
            "paths": [list of relative image paths for found words]
        }
    """
    if not text:
        return {"found": [], "missing": [], "paths": []}

    available_words = set(get_available_words())
    input_words = text.strip().lower().split()
    
    found = []
    missing = []
    paths = []

    for word in input_words:
        # Simple cleanup
        clean_word = word.strip(".,!?\"'") 

        # Check exact match
        if clean_word in available_words:
            found.append(clean_word)
            path = _find_image_filename(clean_word)
            if path:
                paths.append(path)
        else:
            # Fallback: Finger spelling
            missing.append(clean_word)
            for char in clean_word:
                if char.isalpha():
                    # check if we have the letter gif
                    # Assuming we have a.gif, b.gif etc.
                    if char in available_words:
                         paths.append(f"{char}.gif")
                    else:
                        # try finding it via helper
                         path = _find_image_filename(char)
                         if path:
                             paths.append(path)
            
    return {
        "found": found,
        "missing": missing,
        "paths": paths
    }

def _find_image_filename(word):
    """Helper to find the filename with extension for a word."""
    # This is a bit inefficient to listdir every time, but fine for small scale.
    # Optimization: Cache this if performance matters.
    for filename in os.listdir(IMAGES_DIR):
        if filename.lower().startswith(word + "."):
             return filename
    return None
