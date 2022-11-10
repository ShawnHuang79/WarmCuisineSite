UPDATE wcs.customers
	SET email=?, name=?, password=?, birthday=?, address=?, phone=?, subscribed=?
    WHERE id=?;

UPDATE wcs.customers
	SET password=?
    WHERE id=?;