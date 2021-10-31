//
//  main.swift
//  HW5-Mirovaia
//
//  Created by Christine Mirovaia on 31.10.21.
//

import Foundation

//MARK: -
//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

enum Color {
    case white
    case red
    case blue
    case black
    case yellow
}

enum DoorStatus {
    case open
    case close
}

enum WindowStatus {
    case open
    case close
}

enum EngineStatus {
    case start
    case stop
}

enum Transmission {
    case manual
    case avtomat
    case robot
}

enum CarAudio {
    case available
    case missed
}

protocol Car {
    var brand: String { get set }
    var color: Color { get set }
    var doorStatus: DoorStatus { get set }
    var windowStatus: WindowStatus { get set }
    var engineStatus: EngineStatus { get set }
    var transmission: Transmission { get set }
    var carAudio: CarAudio { get set }
     
}

extension Car {
    
    //MARK: - Actions with car windows
    
    mutating func openWindow() {
        windowStatus = .open
    }
    mutating func closeWindow() {
        windowStatus = .close
    }
    //MARK: - Actions with car doors
    
    mutating func startEngine() {
        engineStatus = .start
    }
    mutating func stopEngine() {
        engineStatus = .stop
    }
}

final class SportCar: Car {
    var transmission: Transmission
    var brand: String
    var color: Color
    var doorStatus: DoorStatus = .close
    var windowStatus: WindowStatus = .close
    var engineStatus: EngineStatus
    var carAudio: CarAudio
    var nitro: Bool
    var maxSpeed: Int
    
    
    init ( brand: String,
           color: Color,
           actionEngine: EngineStatus,
           carAudio: CarAudio,
           transmission: Transmission,
           nitro: Bool,
           maxSpeed: Int)
    {
        
        self.transmission = transmission
        self.brand = brand
        self.color = color
        self.engineStatus = actionEngine
        self.carAudio = carAudio
        self.nitro = nitro
        self.maxSpeed = maxSpeed
    }
}

final class TrunkCar: Car {
    var transmission: Transmission
    var brand: String
    var color: Color
    var doorStatus: DoorStatus = .close
    var windowStatus: WindowStatus = .close
    var engineStatus: EngineStatus
    var carAudio: CarAudio
    var volumeTank: Int
    var movementTank: Bool
    
   init (brand: String,
         color: Color,
         actionEngine: EngineStatus,
         carAudio: CarAudio,
         transmission: Transmission,
         movementTank: Bool,
         volumeTank: Int)
   {
    
    self.transmission = transmission
    self.brand = brand
    self.color = color
    self.engineStatus = actionEngine
    self.carAudio = carAudio
    self.movementTank = movementTank
    self.volumeTank = volumeTank
   }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        "\(brand)\n\(color)\n\(engineStatus)\n\(carAudio)\n\(transmission)\n\(nitro)\n\(maxSpeed)\n"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        "\(brand)\n\(color)\n\(engineStatus)\n\(carAudio)\n\(transmission)\n\(movementTank)\n\(volumeTank)\n"
    }
}


var tesla = SportCar(brand: "Tesla",
                     color: .red,
                     actionEngine: .start,
                     carAudio: .available,
                     transmission: .avtomat,
                     nitro: false,
                     maxSpeed: 320)

tesla.startEngine()

var ferrari = SportCar(brand: "Ferrari",
                       color: .red,
                       actionEngine: .stop,
                       carAudio: .missed,
                       transmission: .manual,
                       nitro: true,
                       maxSpeed: 460)
ferrari.stopEngine()

var subaru = SportCar(brand: "Subaru",
                      color: .black,
                      actionEngine: .start,
                      carAudio: .missed,
                      transmission: .robot,
                      nitro: true,
                      maxSpeed: 400)
subaru.closeWindow()

var hyundai = TrunkCar(brand: "Hyundai",
                       color: .white,
                       actionEngine: .stop,
                       carAudio: .missed,
                       transmission: .manual,
                       movementTank: true,
                       volumeTank: 32000)
hyundai.openWindow()

var man = TrunkCar(brand: "MAN",
                   color: .yellow,
                   actionEngine: .start,
                   carAudio: .available,
                   transmission: .manual,
                   movementTank: false,
                   volumeTank: 30000)
man.openWindow()

print(tesla.description)
print(ferrari.description)
print(subaru.description)
print(man.description)
print(hyundai.description)
