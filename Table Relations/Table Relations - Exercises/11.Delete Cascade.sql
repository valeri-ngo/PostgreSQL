ALTER TABLE countries
	ADD CONSTRAINT pk_countries_continents
		FOREIGN KEY (continent_code)
			REFERENCES continents(continent_code)
				ON DELETE CASCADE
	;

ALTER TABLE countries
	ADD CONSTRAINT pk_currencies_countries
		FOREIGN KEY (currency_code)
			REFERENCES currencies(currency_code)
				ON DELETE CASCADE
	;
