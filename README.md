# Pokedex iOS (iOS lessons)

## Team

- Benjamin Budet (budet_b)
- Valentin Dewolf (dewolf_v)
- Nicolas Perrier (perrie_n)

## Installation

### Require:
- MacOS Mojave
- XCode 10

### Installation with carthage

`carthage update --platform ios`

/!\ After installation you have to drag and drop ML model in the ML folder in XCode /!\

## TP1
- CollectionView with pokemons image
- TableView with pokemons images, name, type1, type2
- Switch to change CollectionView/TableView display
- On click on cell => segue to a Pokemon detail View Controller
- Pokemon detail: Name, image, type1, type2, height, width, Pre-evolution (if exists)
- ML Part: utilisation of CoreML on Pokemon dataset (available here: https://1drv.ms/u/s!AgcDO211FgmP2XnWYjQyVDZU2oZc)
- Can find pokemon from photo library and you can take a picture

## TP2
- Add new item on tab bar
- Possibility to connect with an AppleTV (require PokedexTv app)
- Possibility to generate a Pokemon and send it to the AppleTV app through PeerToPeer
