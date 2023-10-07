/*
 1. შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს.
 function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.
 */

enum DayOfWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func isTodayWeekdayOrWeekend (day: DayOfWeek) {
    switch day {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        print("Today is Weekday")
    case .saturday, .sunday:
        print("Today is Weekend")
    }
}

isTodayWeekdayOrWeekend(day: .saturday)


/*
 2. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated
 value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ
 შესაბამისი ამინდის მიხედვით.
 */

enum TodaysWeather {
    case sunny(range: ClosedRange<Double>)
    case cloudy(range: ClosedRange<Double>)
    case rainy(range: ClosedRange<Double>)
    case snowy(range: ClosedRange<Double>)
}

func whatToWear (weather: TodaysWeather, temperature: Double) {
    switch weather {
    case .sunny(let range):
        if range.contains(temperature) {
            print("Today is hot, wear lightweight clothing.")
        }
    case .cloudy(let range):
        if range.contains(temperature) {
            print("Today is cloud,  maybe it will rain, wear a waterproof jacket.")
        }
    case .rainy(let range):
        if range.contains(temperature) {
            print("Today is rainy, wear a raincoat, and don't forget to grab an umbrella.")
        }
    case .snowy(let range):
        if range.contains(temperature) {
            print("Today is snowy, wear a warm coat, waterproof boots, gloves, and a hat.")
        }
    }
}

let sunnyDay = TodaysWeather.sunny(range: 25.0...40.0)
let cloudyDay = TodaysWeather.cloudy(range: 10.0...25.0)
let rainyDay = TodaysWeather.rainy(range: 5.0...20.0)
let snowyDay = TodaysWeather.snowy(range: -10.0...5.0)

whatToWear(weather: sunnyDay, temperature: 30.0)

/*
 3. შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით
 array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function
 რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც
 გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.
 */

struct Book: CustomStringConvertible { //ეს დავუწერე, რადგან უცნაურად იპრინტებოდა//
    var title: String
    var author: String
    var publicationYear: Int
    
    var description: String {
        return "Title: \(title), Author: \(author), Year: \(publicationYear)"
    }
}
var books: [Book] = []
let book1 = Book(title: "Shantaram", author: "Gregory David Roberts", publicationYear: 2003)
let book2 = Book(title: "The Brothers Karamazov ", author: "Fyodor Dostoevsky", publicationYear: 1879)
let book3 = Book(title: "The Master and Margarita", author: "Mikhail Bulgakov", publicationYear: 1973)
let book4 = Book(title: "The Count of Monte Cristo", author: "Alexandre Dumas", publicationYear: 1844)

books.append(book1)
books.append(book2)
books.append(book3)
books.append(book4)

//print(books)

func bookPublishedAfter (_ books: [Book], year: Int) -> [Book] {
    let filteredBooks = books.filter { $0.publicationYear > year }
    return filteredBooks
}

let booksPublished = bookPublishedAfter(books, year: 2000)
print(booksPublished)


/*
 4. შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance. ამ ობიექტში
 დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა
 ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ.
 print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები . ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების
 იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.
 */

struct BankAccount {
    var holderName: String
    var accountNumber: Int
    var balance: Int
    
    mutating func deposit(amount: Int) {
        balance += amount
        print("Deposit of \(amount) Gel is successful. New balance: \(balance) Gel")
        
    }
    
    mutating func withdraw(amount:Int) {
        if amount < balance {
            balance -= amount
            print("Withdraw of \(amount) Gel is successful. New balance: \(balance) Gel")
        } else if amount < 0 {
            print("Error, you can not withdraw a negative amount")
        } else {
            print("Insufficient balance: \(balance)")
        }
    }
}

var myBankAccount = BankAccount(holderName: "Ani Kardava", accountNumber: 999999999, balance: 1200)
myBankAccount.deposit(amount: 1000)
myBankAccount.withdraw(amount: 200)
myBankAccount.withdraw(amount: 2500)
myBankAccount.withdraw(amount: -5) //აქ სწორად არ მიპრინტავს და ვერ ვხვდები რატო ვერ აღიქვამს, რაც else if-ში მაქვს გაწერილი.



/*
 5. შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties:
 title, artist, duration, genre, description (computied property უნდა იყოს description) და publisher
 (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ
 (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს,
 function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.
 */

enum Genre {
    case rock
    case jazz
    case blues
    case metal
    case pop
    case techno
    case rap
    case classical
    case country
}

struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    
    var description: String {
        return "\(title) by \(artist) - \(duration) seconds (\(genre))"
    }
    
    lazy var publisher: String = {
        return "Publisher"
    }()
    
    init(title: String, artist: String, duration: Double, genre: Genre, publisher: String? = nil) {
        self.title = title
        self.artist = artist
        self.duration = duration
        self.genre = genre
        if let publisher = publisher {
            self.publisher = publisher
        }
    }
}

var myPlaylist: [Song] = []

var song1 = Song(title: "Ashes to Ashes", artist: "David Bowie", duration: 3.35, genre: .rock)
var song2 = Song(title: "Bohemian Rhapsody", artist: "Queen", duration: 5.55, genre: .rock)
var song3 = Song(title: "Hey You", artist: "Pink Floyd", duration: 4.40, genre: .rock, publisher: "Pink Floyd Music Publishers Ltd")
var song4 = Song(title: "La vie en rose", artist: "Édith Piaf", duration: 3.06, genre: .jazz, publisher: "Columbia")
var song5 = Song(title: "The End", artist: "The Doors", duration: 11.41, genre: .rock)
var song6 = Song(title: "The Four Seasons", artist: "Vivaldi", duration: 42.00, genre: .classical, publisher: "Schirmer")

myPlaylist.append(song1)
myPlaylist.append(song2)
myPlaylist.append(song3)
myPlaylist.append(song4)
myPlaylist.append(song5)
myPlaylist.append(song6)

func filterSongs(by genre: Genre, in playlist: [Song]) -> [Song] {
    return playlist.filter { $0.genre == genre }
}

let filteredSongs = filterSongs(by: .rock, in: myPlaylist)
for song in filteredSongs {
    print(song.description)
}

