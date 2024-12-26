SCRIPT_NAME=activity_log.sh
LOG_DIR=activity_log
SCRIPT_PATH=$(PWD)/$(SCRIPT_NAME)
INSTALL_DIR=$(PWD)/$(LOG_DIR)

$(LOG_DIR):
	@mkdir -p $(LOG_DIR)

$(INSTALL_DIR)/$(SCRIPT_NAME): $(LOG_DIR) $(SCRIPT_NAME)
	@cp $(SCRIPT_NAME) $(INSTALL_DIR)
	@chmod +x $(INSTALL_DIR)/$(SCRIPT_NAME)

.PHONY: install
install: $(INSTALL_DIR)/$(SCRIPT_NAME)
	@echo "Inizio installazione..."
	@echo "Aggiunto il percorso di activity_log al PATH."
	@echo "export PATH=$$PATH:$(INSTALL_DIR)" >> ~/.bashrc
	@echo "alias log='$(INSTALL_DIR)/$(SCRIPT_NAME)'" >> ~/.bashrc
	@echo "Aggiunto 'log' tra i tuoi alias in .bashrc."
	@echo "L'installazione è completata."
	@echo "Ora puoi eseguire il programma digitando 'log'."
	@echo "Esegui 'source ~/.bashrc' per applicare le modifiche."


.PHONY: uninstall
uninstall:
	@echo "Rimuovendo l'installazione..."
	@rm -rf $(INSTALL_DIR)
	@sed -i '/$(INSTALL_DIR)/d' ~/.bashrc
	@sed -i '/alias log/d' ~/.bashrc
	@echo "Disinstallazione completata. L'alias 'log' è stato rimosso e il percorso è stato eliminato dal tuo .bashrc."
	@echo "Esegui 'source ~/.bashrc' per applicare le modifiche."
