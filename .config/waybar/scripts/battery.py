#!/usr/bin/python

import os


def main():
    STATUS = get_battery_status(get_battery_info().split("\n"))
    PERCENTAGE = get_battery_percentage(get_battery_info().split("\n"))

    build_message(STATUS, PERCENTAGE)


def get_battery_info():
    return os.popen("upower -i `upower -e | grep 'BAT'`").read()
).read()


def split_by_newline(string):
    return string.split("\n")


def get_battery_percentage(batteryinfo):
    for line in batteryinfo:
        if "percentage" in line:
            return line.split(":")[1].replace("%", "").replace(" ", "")


def get_battery_status(batteryinfo):
    for line in batteryinfo:
        if "state" in line:
            return line.split(":")[1].replace(" ", "")


def message_switch(num):
    switch = {
        1: "",
        2: "",
        3: "",
        4: "",
        5: "",
    }
    return switch.get(num, "invalid input")


def build_message(STATUS, PERCENT):
    return STATUS + ":" + get_battery_symbol(PERCENT) + ":" + PERCENT


def get_battery_symbol(percentage):
    percentage = int(percentage)
    num = 1
    if percentage > 80:
        num = 5
    if percentage > 60:
        num = 4
    if percentage > 40:
        num = 3
    if percentage > 20:
        num = 2

    return message_switch(num)


if __name__ == "__main__":
    main()
