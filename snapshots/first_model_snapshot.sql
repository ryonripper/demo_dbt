{% snapshot first_model_snapshot %}
    {{
            config(
                target_database='dev',
                target_schema='snapshots',
                unique_key='id',

                strategy='timestamp',
                updated_at='updated_at',
            )
    }}
    --Pro Tip: Use Sources in Snapshots!
    SELECT * FROM {{ ref('my_first_dbt_model') }}

    {% endsnapshot %}