#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN PB5  // Pin 13 del Arduino Uno

int main(void) {
    DDRB |= (1 << LED_PIN);  // Configura LED_PIN como salida

    while (1) {
        PORTB ^= (1 << LED_PIN);  // Alterna el estado del LED
        _delay_ms(1000);         // Espera 1 segundo
    }

    return 0;
}
