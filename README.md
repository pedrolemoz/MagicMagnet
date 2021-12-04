<p align="center">
    <img src='https://i.imgur.com/nGgPVSK.png' alt='Magic Magnet Banner'/>
<p align="center">
  <img src="https://i.imgur.com/jZWZ1hQ.png" width=200px/>
  <img src="https://i.imgur.com/ZpHxVAv.png" width=200px/>

![Flutter version](https://img.shields.io/badge/flutter-1.26.0-blue)
![Dart version](https://img.shields.io/badge/dart-%202.12.0-blue)
![GitHub repo size](https://img.shields.io/github/repo-size/pedrolemoz/MagicMagnet?color=red)
[![Project Owner](https://img.shields.io/badge/owner-Pedro%20Lemos-orange)](https://github.com/pedrolemoz/)
![GitHub stars](https://img.shields.io/github/stars/pedrolemoz/MagicMagnet?style=social)
[![GitHub forks](https://img.shields.io/github/forks/pedrolemoz/MagicMagnet?style=social)](https://github.com/pedrolemoz/MagicMagnet/fork)

## Screenshots

<span>
  <img src="https://i.imgur.com/c6rHO1J.png" width=200px/>
  <img src="https://i.imgur.com/G2qLmC7.png" width=200px/>
  <img src="https://i.imgur.com/XpEW2cd.png" width=200px/>
  <img src="https://i.imgur.com/T7MtWRP.png" width=200px/>
</span>

<span>
  <img src="https://i.imgur.com/Lgz1uAX.png" width=200px/>
  <img src="https://i.imgur.com/2PREZ1J.png" width=200px/>
  <img src="https://i.imgur.com/rADSvsY.png" width=200px/>
  <img src="https://i.imgur.com/Hsm0R68.png" width=200px/>
</span>

## What is Magic Magnet?

Magic Magnet is an app that acts like a crawler, and let you search for magnet links in a lot of places without any effort. You can open the magnet link in another app (you may have a torrent client installed in your system), copy the link to the clipboard and even see the original source of the link.

## Why this project was created?

The idea came when I searched for a specific torrent, and lots of ads were thrown on my screen, and when I finally got the magnet link, unfortunately, there was no seeders. I realized how painful and stressful this task could be, and I decided to automate this process using programming. The first version of this project was released in December 2019, written in [Python3](https://github.com/pedrolemoz/MagicMagnet/tree/python), and was limted to desktop users. I made a lot of improvements in that version, added new search providers, and minor improvements.

I felt that Python was not the best choice for a project like this. Python is not fast (and we definatelly need speed in a crawler), can't compile for mobile (I know that Kivy and BeeWare are options, but I wanted something reliable), and in general, the code was not optmized. I'm working with Flutter nowadays, and rewrote this app in Dart, because Flutter compiles natively for Android, iOS, Web, Windows, macOS and Linux, and suits perfectly with my project.

I'm currently developing this app, and it will be avaliable in Google Play soon. All the releases will be also uploaded to GitHub.

## Technologies that are being used in Magic Magnet

As mentioned, this app uses the [Flutter framework](https://flutter.dev), which is powered by the [Dart language](https://dart.dev). This app also implements the [Uncle Bob's concept of Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).

#### Specific Flutter dependencies:
  - Magic Magnet Engine: my own engine to make this app.
  - Flutter Modular for dependency injection and routing (well known in Flutter brazilian community, due its authors, from Flutterando)
  - MobX for State Management (included all the related stuff, such build_runner, mobx_codegen...)
  - Dartz and Equatable to some functional programming features
  - [Unicons](https://pub.dev/packages/unicons), the icon package from Iconscout that I'm mantainer of

## Can I compile this app from source?

Well, you can't. Only the user interface is open source. This app requires my own engine in order to work properly. If you are really interested in working in this project, contact me for more details.
