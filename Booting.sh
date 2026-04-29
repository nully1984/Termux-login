#!/usr/bin/zsh

# --- COLOR CONFIGURATION ---
GREEN='\e[32m'
RED='\e[31m'
WHITE='\e[97m'
CYAN='\e[36m'
YELLOW='\e[33m'
ENDCOLOR='\e[0m'

# --- FORCE CLOSE FUNCION ---
trigger_panic() {
    clear
    echo -e "${RED}[    0.000000] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs ]---"
    sleep 0.1
    echo -e "[    0.000002] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.10-arch1-1"
    
    # Animasi Error Mem-Leak
    for j in {1..60}; do
        echo -e "[${RED}  ERROR  ${ENDCOLOR}] Mem-Leak: 0x$(printf '%x' $RANDOM) - Page violation at $(date +%s%N)"
        sleep 0.01
    done

    echo -e "\n${RED}!!! CRITICAL SYSTEM FAILURE !!!"
    echo -e "System halted. Please reboot your System...${ENDCOLOR}"
    
    sleep 2
    
    # --- TERMUX NUKE ---
    kill -9 -1
}

clear

# --- 1. VERBOSE BOOT SIMULATION --
echo -e "${WHITE}Linux ${ENDCOLOR}"
sleep 0.5

for i in {100..500}; do
    echo -e "[$GREEN  OK  $ENDCOLOR] Initializing Hardware: ${CYAN}0x${i}AF${i}${ENDCOLOR}"
    echo -e "[$GREEN  OK  $ENDCOLOR] Module loaded: ${YELLOW}arch_drv_$(printf '%x' $i)${ENDCOLOR}"
    
    # --- 20% CHANCE PANIC (1 to 5) ---
    if [[ $i -eq 320 ]]; then
        if [ $((RANDOM % 5)) -eq 0 ]; then
            echo -e "${RED}[  FAIL  ] Critical I/O Error detected at sector 0x${i}FF${ENDCOLOR}"
            sleep 1
            trigger_panic
        fi
    fi
    sleep 0.004 
done

# Starting Services
services=("AppArmor" "TPM2 Stack" "Docker" "PipeWire" "Network" "Bluetooth" "Systemd" "Hyprland" "TTY1")
for s in "${services[@]}"; do
    echo -e "[$GREEN  OK  $ENDCOLOR] Starting $s..."
    sleep 0.03
done

echo -e "\n${WHITE}Linux TTY1 Login${ENDCOLOR}"

# --- 2. LOGIN SYSTEM ---
attempts=0
while true; do
    echo -n "login: "
    read user_input
    echo -n "password: "
    read -s pass_input
    echo ""

    # Pass
    if [[ "$user_input" == "your username" && "$pass_input" == "your pass" ]]; then
        echo -e "${GREEN}Access Granted. Welcome back, your username.${ENDCOLOR}"
        sleep 1
        clear
        break
    else
        ((attempts++))
        if (( attempts >= 3 )); then
            trigger_panic
        else
            echo -e "${RED}Login incorrect${ENDCOLOR}"
            echo -e "Attempts remaining: $((3 - attempts))"
            sleep 0.5
        fi
  
    fi
done
