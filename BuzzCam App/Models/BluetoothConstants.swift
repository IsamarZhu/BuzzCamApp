//
//  BluetoothConstants.swift
//  BuzzCam App
//
//  Created by Responsive Environments on 10/27/23.
//

import Foundation
import CoreBluetooth

struct SystemInfoPacketData {
    var index: UInt32
    var temperature: Float
    var humidity: Float
    var gas: Float
    var light_level: Float
    var sd_detected: Bool = false
    var space_remaining: UInt64
    var estimated_recording_time: UInt64
    var battery_charging: Bool
    var battery_voltage: Float
    var device_recording: Bool
    var mark_number: UInt32
    var discovered_devices: [Device]
    var gps_location: Location
    var buzz_interval_data: BuzzIntervalData
    var buzz_summary_data: BuzzSummaryData
    var radio_power: RadioPower
    
    mutating func reset() {
        // set property default values
        index = 0
        temperature = 0.0
        humidity = 0.0
        gas = 0.0
        light_level = 0.0
        sd_detected = false
        space_remaining = 0
        estimated_recording_time = 0
        battery_charging = false
        battery_voltage = 0.0
        device_recording = false
        mark_number = 0
        discovered_devices = []
        gps_location = Location()
        buzz_interval_data = BuzzIntervalData()
        buzz_summary_data = BuzzSummaryData()
        radio_power = RadioPower()
    }
}

// config data
struct ConfigPacketData_Audio {
    var channel1: Bool
    var channel2: Bool
    var sampleFreq: MicSampleFreq
    var bitResolution: MicBitResolution
    var audioCompressionEnabled: Bool
    var audioCompressionType: CompressionType
    var audioCompressionFactor: UInt32
    var estimatedRecordTime: Float
    var freeRunMode: Bool
    var chirpEnable: Bool
    var micGain: MicGain
    
    mutating func reset() {
        channel1 = false
        channel2 = false
        sampleFreq = MicSampleFreq()
        bitResolution = MicBitResolution()
        audioCompressionEnabled = false
        audioCompressionType = CompressionType()
        audioCompressionFactor = 0
        estimatedRecordTime = 0.0
        freeRunMode = false
        chirpEnable = false
        micGain = MicGain()
    }
}

struct ConfigPacketData_Schedule {
    var scheduleConfig: [ScheduleConfig]
    
    mutating func reset() {
        scheduleConfig = []
    }
}

struct ConfigPacketData_Sensor {
    var samplePeriodMs: UInt32 = 0
    var enableTemperature: Bool = false
    var enableHumidity: Bool = false
    var enableGas: Bool = false
    
    mutating func reset() {
        samplePeriodMs = 0
        enableTemperature = false
        enableHumidity = false
        enableGas = false
    }
}

struct ConfigPacketData_NetworkState {
    var numberOfDiscoveredDevices: UInt32 = 0
    var discoveredDeviceUid: [DeviceUID] = []
    var slaveSync: Bool = false
    var masterNode: Bool = false
    var panID: UInt32 = 0
    var channel: UInt32 = 0
    
    
    mutating func reset() {
        numberOfDiscoveredDevices = 0
        discoveredDeviceUid = []
        slaveSync = false
        masterNode = false
        panID = 0
        channel = 11
    }
}

struct ConfigPacketData_LowPower {
    var lowPowerMode: Bool = false
    
    mutating func reset() {
        lowPowerMode = false
    }
}

struct SpecialFunctionData {
    
    var uwbPacket: UWB_Packet
    
    mutating func reset() {
        uwbPacket = UWB_Packet()
    }
}

struct ConfigPacketData {
    var enableRecording: Bool = false
    var enableLed: Bool = false
    
    mutating func reset() {
        enableRecording = false
        enableLed = false
    }
}

//struct ClassifierPacketData {
//    var classifier_version: Float = 0.0
//    var epoch_last_detection: UInt64 = 0
//    var buzz_count_total: UInt32 = 0
//    var species_1_count_total: UInt32 = 0
//    var species_2_count_total: UInt32 = 0
//    var buzz_count_day: UInt32 = 0
//    var species_1_count_day: UInt32 = 0
//    var species_2_count_day: UInt32 = 0
//    
//    mutating func reset() {
//        classifier_version = 0.0
//        epoch_last_detection = 0
//        buzz_count_total = 0
//        species_1_count_total = 0
//        species_2_count_total = 0
//        buzz_count_day = 0
//        species_1_count_day = 0
//        species_2_count_day = 0
//    }
//    
//}
