library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Componentes.all;

entity Ctrl_Servos is
    port
    (
        clk : in std_logic;         -- Frecuencia principal = 50MHz
        rst : in std_logic;         -- Reset general
        Positivo1, Positivo2, Positivo3, Positivo4 : in std_logic; -- Aumenta el ángulo
        Negativo1, Negativo2, Negativo3, Negativo4 : in std_logic; -- Disminuye el ángulo
        PWM1, PWM2, PWM3, PWM4 : out std_logic; -- Salidas PWM
        selector : in std_logic_vector(1 downto 0) -- Selección del servomotor
    );
end Ctrl_Servos;

architecture rtl of Ctrl_Servos is

-- Señales para los ángulos de cada servomotor
signal angulo1, angulo2, angulo3, angulo4 : std_logic_vector(19 downto 0);

begin -- Este es el `begin` principal de la arquitectura

-- Instancias de Generador_PWM y control de ángulo para cada servomotor

-- Servomotor 1
Servo1_Angulo : Ctrl_Angulo
port map
(
    clk => clk,
    rst => rst,
    Positivo => Positivo1,
    Negativo => Negativo1,
    Angulo => angulo1
);

Servo_PWM1 : Generador_PWM
port map
(
    clk => clk,
    rst => rst,
    angulo => angulo1,
    PWM => PWM1
);

-- Servomotor 2
Servo2_Angulo : Ctrl_Angulo
port map
(
    clk => clk,
    rst => rst,
    Positivo => Positivo2,
    Negativo => Negativo2,
    Angulo => angulo2
);

Servo_PWM2 : Generador_PWM
port map
(
    clk => clk,
    rst => rst,
    angulo => angulo2,
    PWM => PWM2
);

-- Servomotor 3
Servo3_Angulo : Ctrl_Angulo
port map
(
    clk => clk,
    rst => rst,
    Positivo => Positivo3,
    Negativo => Negativo3,
    Angulo => angulo3
);

Servo_PWM3 : Generador_PWM
port map
(
    clk => clk,
    rst => rst,
    angulo => angulo3,
    PWM => PWM3
);

-- Servomotor 4
Servo4_Angulo : Ctrl_Angulo
port map
(
    clk => clk,
    rst => rst,
    Positivo => Positivo4,
    Negativo => Negativo4,
    Angulo => angulo4
);

Servo_PWM4 : Generador_PWM
port map
(
    clk => clk,
    rst => rst,
    angulo => angulo4,
    PWM => PWM4
);

end rtl;