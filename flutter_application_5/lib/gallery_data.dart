List<GalleryItem> galleryData = [
  GalleryItem(
    imageTitle: 'Ein kleiner Lauf',
    imageDate: '03.06.2023',
    imageDescription:
        'Laufen ist einfach: Die Schuhe an, einen Schritt vor den anderen und losjoggen. Dafür sind wir alle gemacht. Nicht zum Sitzen, nicht zum Stehen, nein, zum Laufen sind wir geboren! Da Laufen zwar einfach, besonders der Einstieg ins Joggen aber nicht immer leicht ist, stehe ich – Jan Fitschen – euch bei euren ersten Schritten in ein gesünderes, fitteres und glücklicheres Leben zur Seite.',
    imagePath: 'assets/images/download-8.jpg',
  ),
  GalleryItem(
    imageTitle: 'Tischtennis!',
    imageDate: '14.07.2020',
    imageDescription:
        'Tischtennis ist ein unglaublich vielseitiger Kraftsport für Herz, Kreislauf und Körper. Um schnell reagieren zu können, ist der Mensch ständig in Bewegung. Dabei beanspruchte man viele Muskelgruppen gleichzeitig, ohne die Gelenke zu stark zu belasten.',
    imagePath: 'assets/images/download-9.jpg',
  ),
  GalleryItem(
    imageTitle: 'Basketball',
    imageDate: '18.06.2022',
    imageDescription:
        'Basketball ist nicht eine aller Möglichkeiten, fit zu bleiben, sondern kann Ihnen auch helfen: neue Freunde kennenzulernen und sie regelmäßig zu sehen. Es lehrt Sie, ein guter Teamplayer zu sein. Es kann von Menschen aller Altersgruppen und Leistungsstufen gespielt werden. Es kann das ganze Jahr über gespielt werden, da es normalerweise ein Hallensport ist.',
    imagePath: 'assets/images/download-10.jpg',
  ),
  GalleryItem(
    imageTitle: 'Runners High',
    imageDate: '22.09.2023',
    imageDescription:
        'Unsere acht Läufer bewegen sich hier in einer beeindruckenden Dreiecks-Formation über die Bahnen des sonnigen Sportplatzes am Mauerpark. Alle Athleten sind synchronisiert, ihre Schritte im perfekten Einklang, während sie die rote Tartanbahn unter ihren Füßen spüren. An einem kühlen Herbstmorgen, während eines intensiven Trainings, wurde diese Formation gewählt, um Teamarbeit und Präzision zu perfektionieren, und es war ein Moment, der die Entschlossenheit und den Zusammenhalt der Gruppe widerspiegelte.',
    imagePath: 'assets/images/download-11.jpg',
  ),
  GalleryItem(
    imageTitle: 'Schimmen Time',
    imageDate: '11.08.2018',
    imageDescription:
        'Schwimmen ist ein hervorragender Ausdauersport. Es trainiert den Herzmuskel. Es treibt das Herz-Kreislauf-System an. Es stärkt das Immunsystem, weil viele Stoffwechselprozesse in Gang gesetzt werden.',
    imagePath: 'assets/images/download-12.jpg',
  ),
  GalleryItem(
    imageTitle: 'Soccer',
    imageDate: '29.11.2023',
    imageDescription:
        'verbesserte Schnelligkeit, Kraft und Ausdauer im Alltag. Gute körperliche Bewegungsfähigkeit (Koordination) auch unter Stress. Erweiterung sozialer Fähigkeiten durch gemeinschaftliches Erleben von Erfolg und Misserfolg, Stärkung des eigenen Selbstvertrauens.',
    imagePath: 'assets/images/download-13.jpg',
  ),
  GalleryItem(
    imageTitle: 'Immer Trainieren',
    imageDate: '02.05.2022',
    imageDescription:
        'Es ist absolut richtig. Um Muskelmasse aufzubauen muss man nicht zwangsweise schwer trainieren und schon gar nicht im reinen Maximalkraftbereich, wie etwa ein Powerlifter. Hier kann man auch mit verhältnismäßig geringen Gewichten trainieren und tolle Muskelaufbau-Erfolge sehen. Dennoch macht es für wirklich jeden Sinn, auch regelmäßig richtig schwer zu trainieren. ',
    imagePath: 'assets/images/download-14.jpg',
  ),
];

class GalleryItem {
  // Attribute
  final String imageTitle;
  final String imageDate;
  final String imageDescription;
  final String imagePath;

  // Konstruktor
  GalleryItem(
      {required this.imageTitle,
      required this.imageDate,
      required this.imageDescription,
      required this.imagePath});
}
