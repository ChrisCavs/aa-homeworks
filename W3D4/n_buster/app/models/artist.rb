class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query

    # result = Artist.connection.execute(<<-SQL)
    #   SELECT
    #     albums.title, COUNT(*) AS tracks_count
    #   FROM
    #     albums JOIN tracks
    #       ON tracks.album_id = albums.id
    #   WHERE
    #     albums.artist_id = 1
    #   GROUP BY
    #     albums.title
    # SQL
    #since Artist inherits from ActiveRecord::Base, we can start a
    #connection to the database and query it.

    # result.values # gives output in embedded array instead of hash



    result = albums = self
      .albums
      .select('albums.title, COUNT(*) AS tracks_count')
      .joins(:tracks)
      .group('albums.title')

    result_hash = {}

    result.each do |data|
      result_hash[data.title] = data.tracks_count
    end
    result_hash


    # SELECT
    #   albums.title, COUNT(*) AS tracks_count
    # FROM
    #   albums JOIN tracks
    #     ON tracks.album_id = albums.id
    # WHERE
    #   albums.artist_id = 1
    # GROUP BY
    #   albums.title


    #       title         | tracks_count
    # ----------------------+--------------
    # 4                    |            1
    # B'Day                |            4
    # Dangerously in Love  |            3
    # I Am... Sasha Fierce |            6
    # Lemonade             |            8


    # <ActiveRecord::AssociationRelation
    # [#<Album id: nil, title: "4">,
    #  #<Album id: nil, title: "B'Day">,
    # <Album id: nil, title: "Dangerously in Love">,
    # <Album id: nil, title: "I Am... Sasha Fierce">,
    # <Album id: nil, title: "Lemonade">]>
  end
end
