MCU = atmega328p
F_CPU = 16000000UL
PORT = /dev/ttyACM0
BAUD = 115200
PROGRAMMER = arduino

CFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU) -Os

all: blink.hex

%.o: %.c
    avr-gcc $(CFLAGS) -c $< -o $@

%.elf: %.o
    avr-gcc $(CFLAGS) $< -o $@

%.hex: %.elf
    avr-objcopy -O ihex -R .eeprom $< $@

upload: blink.hex
    avrdude -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD) -U flash:w:$<

clean:
    rm -f *.o *.elf *.hex
