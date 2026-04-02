import pandas as pd
import numpy as np

n = 10000

df = pd.DataFrame({
    "user_id": np.random.randint(1, 1000, n),
    "mod_id": np.random.randint(1, 500, n),
    "game_id": np.random.randint(1, 50, n),
    "event_name": np.random.choice(
        ["view_mod", "download_mod", "upload_mod", "like_mod"], n, 
        p=[0.5, 0.3, 0.1, 0.1]
    ),
    "timestamp": pd.date_range(
            "2026-01-01", periods=n, freq="min"
        )
})

df.to_csv("seeds/events.csv", index=False)