class PlayersController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
      @players = Player.all

        #キーワード検索
        search_columns = params[:search_columns] || [] 
        
        if params[:search].present? && search_columns.any?
              conditions = search_columns.map { |column| "#{column} LIKE :search" }.join(" OR ")
              @players = Player.where(conditions, search: "%#{params[:search]}%")
        end

        #検索
        conditions = []
        values = []

        #カテゴリー(高校生/大学生/社会人/独立)
        if params[:categorysearch].present?
          conditions << "category = ?"
          values << params[:categorysearch]
        end

        #投
        if params[:tsearch].present?
          conditions << "throws LIKE ?"
          values << "%#{params[:tsearch]}%"
        end

        #打
        if params[:bsearch].present?
          conditions << "bats LIKE ?"
          values << "%#{params[:bsearch]}%"
        end

        #年 年度
        birthdaysearch_columns = params[:birthdaysearch_columns] || []

        if params[:yearsearch].present?
          if birthdaysearch_columns.include?("cyear")
            conditions << "cyear LIKE ?"
            values << "%#{params[:yearsearch]}%"
          end
          if birthdaysearch_columns.include?("fyear")
            conditions << "fyear LIKE ?"
            values << "%#{params[:yearsearch]}%"
          end
        end

        #月
        if params[:monthsearch].present?
          conditions << "month LIKE ?"
          values << "%#{params[:monthsearch]}%"
        end
        
        #日
        if params[:datesearch].present?
          conditions << "date LIKE ?"
          values << "%#{params[:datesearch]}%"
        end

        #出身
        if params[:psearch].present? && psearch_columns.any?
          conditions << psearch_columns.map { |column| "#{column} LIKE :psearch" }.join(" OR ")
          values << "%#{params[:psearch]}%"
        end

        parametersearch_column = params[:parametersearch_columns] || []

        #ミート
        if params[:meetsearch].present?
          if params[:parametersearch_columns] == 'over'
            conditions << "meet >= ?"
            values << params[:meetsearch]
          else
            conditions << "meet LIKE ?"
            values << "%#{params[:meetsearch]}%"
          end
        end

        #パワー
        if params[:powersearch].present?
          if params[:parametersearch_columns] == 'over'
            conditions << "power >= ?"
            values << params[:powersearch]
          else
            conditions << "power LIKE ?"
            values << "%#{params[:powersearch]}%"
          end
        end

        #走塁
        if params[:runningsearch].present?
          if params[:parametersearch_columns] == 'over'
            conditions << "running >= ?"
            values << params[:runningsearch]
          else
            conditions << "running LIKE ?"
            values << "%#{params[:runningsearch]}%"
          end
        end

        #守備
        if params[:defencesearch].present?
          if params[:parametersearch_columns] == 'over'
            conditions << "defence >= ?"
            values << params[:defencesearch]
          else
            conditions << "defence LIKE ?"
            values << "%#{params[:defencesearch]}%"
          end
        end

        #球威
        if params[:powerfulsearch].present?
          if params[:parametersearch_columns] == 'over'
            conditions << "powerful >= ?"
            values << params[:powerfulsearch]
          else
            conditions << "powerful LIKE ?"
            values << "%#{params[:powerfulsearch]}%"
          end
        end

        #制球
        if params[:controlsearch].present?
          if params[:parametersearch_columns] == 'over'
            conditions << "control >= ?"
            values << params[:controlsearch]
          else
            conditions << "control LIKE ?"
            values << "%#{params[:controlsearch]}%"
          end
        end

        #スタミナ
        if params[:staminasearch].present?
          if params[:parametersearch_columns] == 'over'
            conditions << "stamina >= ?"
            values << params[:staminasearch]
          else
            conditions << "stamina LIKE ?"
            values << "%#{params[:staminasearch]}%"
          end
        end

        #変化球
        if params[:breakingsearch].present?
          if params[:parametersearch_columns] == 'over'
            conditions << "breaking >= ?"
            values << params[:breakingsearch]
          else
            conditions << "breaking LIKE ?"
            values << "%#{params[:breakingsearch]}%"
          end
        end

        #検索用
        if conditions.present?
          query = conditions.join(" AND ")
          @players = Player.where(query, *values)
        end

        #タグ
        if params[:tag_ids].present?
          if params[:tagsearch_type] == 'and'
            player_ids = []
            params[:tag_ids].each do |key, value|
              if value == "1"
                tag_players = Tag.find_by(body: key).players.pluck(:id)
                player_ids << tag_players if tag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:tag_ids].each do |key, value|
              if value == "1"
                tag_players = Tag.find_by(body: key).players.pluck(:id)
                player_ids += tag_players if tag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # メイン投手タグ
        if params[:mptag_ids].present?
          if params[:mstagsearch_type] == 'and'
            player_ids = []
            params[:mptag_ids].each do |key, value|
              if value == "1"
                mptag_players = Mptag.find_by(main_p_position: key).players.pluck(:id)
                player_ids << mptag_players if mptag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:mptag_ids].each do |key, value|
              if value == "1"
                mptag_players = Mptag.find_by(main_p_position: key).players.pluck(:id)
                player_ids += mptag_players if mptag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        #メイン野手捕手タグ
        if params[:mfctag_ids].present?
          if params[:mstagsearch_type] == 'and'
            player_ids = []
            params[:mfctag_ids].each do |key, value|
              if value == "1"
                mfctag_players = Mfctag.find_by(main_fc_position: key).players.pluck(:id)
                player_ids << mfctag_players if mfctag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:mfctag_ids].each do |key, value|
              if value == "1"
                mfctag_players = Mfctag.find_by(main_fc_position: key).players.pluck(:id)
                player_ids += mfctag_players if mfctag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        #メイン野手内野手タグ
        if params[:mfitag_ids].present?
          if params[:mstagsearch_type] == 'and'
            player_ids = []
            params[:mfitag_ids].each do |key, value|
              if value == "1"
                mfitag_players = Mfitag.find_by(main_fi_position: key).players.pluck(:id)
                player_ids << mfitag_players if mfitag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:mfitag_ids].each do |key, value|
              if value == "1"
                mfitag_players = Mfitag.find_by(main_fi_position: key).players.pluck(:id)
                player_ids += mfitag_players if mfitag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        #メイン野手外野手タグ
        if params[:mfotag_ids].present?
          if params[:mstagsearch_type] == 'and'
            player_ids = []
            params[:mfotag_ids].each do |key, value|
              if value == "1"
                mfotag_players = Mfotag.find_by(main_fo_position: key).players.pluck(:id)
                player_ids << mfotag_players if mfotag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:mfotag_ids].each do |key, value|
              if value == "1"
                mfotag_players = Mfotag.find_by(main_fo_position: key).players.pluck(:id)
                player_ids += mfotag_players if mfotag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # 全体投手タグ
        if params[:wptag_ids].present?
          if params[:mstagsearch_type] == 'and'
            player_ids = []
            params[:wptag_ids].each do |key, value|
              if value == "1"
                wptag_players = Wptag.find_by(whole_p_position: key).players.pluck(:id)
                player_ids << wptag_players if wptag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:wptag_ids].each do |key, value|
              if value == "1"
                wptag_players = Wptag.find_by(whole_p_position: key).players.pluck(:id)
                player_ids += wptag_players if wptag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # 全体野手捕手タグ
        if params[:wfctag_ids].present?
          if params[:mstagsearch_type] == 'and'
            player_ids = []
            params[:wfctag_ids].each do |key, value|
              if value == "1"
                wfctag_players = Wfctag.find_by(whole_fc_position: key).players.pluck(:id)
                player_ids << wfctag_players if wfctag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:wfctag_ids].each do |key, value|
              if value == "1"
                wfctag_players = Wfctag.find_by(whole_fc_position: key).players.pluck(:id)
                player_ids += wfctag_players if wfctag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # サブ野手内野手タグ
        if params[:wfitag_ids].present?
          if params[:mstagsearch_type] == 'and'
            player_ids = []
            params[:wfitag_ids].each do |key, value|
              if value == "1"
                wfitag_players = Wfitag.find_by(whole_fi_position: key).players.pluck(:id)
                player_ids << wfitag_players if wfitag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:wfitag_ids].each do |key, value|
              if value == "1"
                wfitag_players = Wfitag.find_by(whole_fi_position: key).players.pluck(:id)
                player_ids += wfitag_players if wfitag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # 全体野手外野手タグ
        if params[:wfotag_ids].present?
          if params[:mstagsearch_type] == 'and'
            player_ids = []
            params[:wfotag_ids].each do |key, value|
              if value == "1"
                wfotag_players = Wfotag.find_by(whole_fo_position: key).players.pluck(:id)
                player_ids << wfotag_players if wfotag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:wfotag_ids].each do |key, value|
              if value == "1"
                wfotag_players = Wfotag.find_by(whole_fo_position: key).players.pluck(:id)
                player_ids += wfotag_players if wfotag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # 予想順位
        if params[:etag_ids].present?
          if params[:etagsearch_type] == 'and'
            player_ids = []
            params[:etag_ids].each do |key, value|
              if value == "1"
                etag_players = Etag.find_by(expectation: key).players.pluck(:id)
                player_ids << etag_players if etag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:etag_ids].each do |key, value|
              if value == "1"
                etag_players = Etag.find_by(expectation: key).players.pluck(:id)
                player_ids += etag_players if etag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # 球種左方向タグ
        if params[:vltag_ids].present?
          if params[:vtagsearch_type] == 'and'
            player_ids = []
            params[:vltag_ids].each do |key, value|
              if value == "1"
                vltag_players = Vltag.find_by(variety: key).players.pluck(:id)
                player_ids << vltag_players if vltag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:vltag_ids].each do |key, value|
              if value == "1"
                vltag_players = Vltag.find_by(variety: key).players.pluck(:id)
                player_ids += vltag_players if vltag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # 球種左下方向タグ
        if params[:vlltag_ids].present?
          if params[:vtagsearch_type] == 'and'
            player_ids = []
            params[:vlltag_ids].each do |key, value|
              if value == "1"
                vlltag_players = Vlltag.find_by(variety: key).players.pluck(:id)
                player_ids << vlltag_players if vlltag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:vlltag_ids].each do |key, value|
              if value == "1"
                vlltag_players = Vlltag.find_by(variety: key).players.pluck(:id)
                player_ids += vlltag_players if vlltag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # 球種下方向タグ
        if params[:vutag_ids].present?
          if params[:vutagsearch_type] == 'and'
            player_ids = []
            params[:vutag_ids].each do |key, value|
              if value == "1"
                vutag_players = Vutag.find_by(variety: key).players.pluck(:id)
                player_ids << vutag_players if vutag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:vutag_ids].each do |key, value|
              if value == "1"
                vutag_players = Vutag.find_by(variety: key).players.pluck(:id)
                player_ids += vutag_players if vutag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # 球種右下方向タグ
        if params[:vlrtag_ids].present?
          if params[:vtagsearch_type] == 'and'
            player_ids = []
            params[:vlrtag_ids].each do |key, value|
              if value == "1"
                vlrtag_players = Vlrtag.find_by(variety: key).players.pluck(:id)
                player_ids << vlrtag_players if vlrtag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:vlrtag_ids].each do |key, value|
              if value == "1"
                vlrtag_players = Vlrtag.find_by(variety: key).players.pluck(:id)
                player_ids += vlrtag_players if vlrtag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        # 球種右方向タグ
        if params[:vrtag_ids].present?
          if params[:vtagsearch_type] == 'and'
            player_ids = []
            params[:vrtag_ids].each do |key, value|
              if value == "1"
                vrtag_players = Vrtag.find_by(variety: key).players.pluck(:id)
                player_ids << vrtag_players if vrtag_players.present?
              end
            end
            player_ids = player_ids.reduce(:&) if player_ids.present? # 積集合を求める
            @players = @players.where(id: player_ids) if player_ids.present?
          else
            player_ids = []
            params[:vrtag_ids].each do |key, value|
              if value == "1"
                vrtag_players = Vrtag.find_by(variety: key).players.pluck(:id)
                player_ids += vrtag_players if vrtag_players.present?
              end
            end
            player_ids.uniq!
            @players = @players.where(id: player_ids) if player_ids.present?
          end
        end

        #索引
        sakuinsearch_columns = params[:sakuinsearch_columns] || []

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'あ'
            @players = Player.where('furigana LIKE ?', 'あ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'い'
          @players = Player.where('furigana LIKE ?', 'い%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'う'
          @players = Player.where('furigana LIKE ?', 'う%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'え'
          @players = Player.where('furigana LIKE ?', 'え%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'お'
          @players = Player.where('furigana LIKE ?', 'お%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'か'
          @players = Player.where('furigana LIKE ?', 'か%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'き'
          @players = Player.where('furigana LIKE ?', 'き%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'く'
          @players = Player.where('furigana LIKE ?', 'く%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'け'
          @players = Player.where('furigana LIKE ?', 'け%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'こ'
          @players = Player.where('furigana LIKE ?', 'こ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'さ'
          @players = Player.where('furigana LIKE ?', 'さ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'し'
          @players = Player.where('furigana LIKE ?', 'し%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'す'
          @players = Player.where('furigana LIKE ?', 'す%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'せ'
          @players = Player.where('furigana LIKE ?', 'せ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'そ'
          @players = Player.where('furigana LIKE ?', 'そ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'た'
          @players = Player.where('furigana LIKE ?', 'た%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ち'
          @players = Player.where('furigana LIKE ?', 'ち%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'つ'
          @players = Player.where('furigana LIKE ?', 'つ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'て'
          @players = Player.where('furigana LIKE ?', 'て%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'と'
          @players = Player.where('furigana LIKE ?', 'と%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'な'
          @players = Player.where('furigana LIKE ?', 'な%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'に'
          @players = Player.where('furigana LIKE ?', 'に%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぬ'
          @players = Player.where('furigana LIKE ?', 'ぬ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ね'
          @players = Player.where('furigana LIKE ?', 'ね%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'の'
          @players = Player.where('furigana LIKE ?', 'の%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'は'
          @players = Player.where('furigana LIKE ?', 'は%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ひ'
          @players = Player.where('furigana LIKE ?', 'ひ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ふ'
          @players = Player.where('furigana LIKE ?', 'ふ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'へ'
          @players = Player.where('furigana LIKE ?', 'へ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ほ'
          @players = Player.where('furigana LIKE ?', 'ほ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ま'
          @players = Player.where('furigana LIKE ?', 'ま%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'み'
          @players = Player.where('furigana LIKE ?', 'み%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'む'
          @players = Player.where('furigana LIKE ?', 'む%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'め'
          @players = Player.where('furigana LIKE ?', 'め%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'も'
          @players = Player.where('furigana LIKE ?', 'も%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'や'
          @players = Player.where('furigana LIKE ?', 'や%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'そ'
          @players = Player.where('furigana LIKE ?', 'ゆ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'よ'
          @players = Player.where('furigana LIKE ?', 'よ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ら'
          @players = Player.where('furigana LIKE ?', 'ら%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'り'
          @players = Player.where('furigana LIKE ?', 'り%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'る'
          @players = Player.where('furigana LIKE ?', 'る%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'れ'
          @players = Player.where('furigana LIKE ?', 'れ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ろ'
          @players = Player.where('furigana LIKE ?', 'ろ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'わ'
          @players = Player.where('furigana LIKE ?', 'わ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'が'
          @players = Player.where('furigana LIKE ?', 'が%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぎ'
          @players = Player.where('furigana LIKE ?', 'ぎ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぐ'
          @players = Player.where('furigana LIKE ?', 'ぐ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'げ'
          @players = Player.where('furigana LIKE ?', 'げ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ご'
          @players = Player.where('furigana LIKE ?', 'ご%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ざ'
          @players = Player.where('furigana LIKE ?', 'ざ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'じ'
          @players = Player.where('furigana LIKE ?', 'じ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ず'
          @players = Player.where('furigana LIKE ?', 'ず%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぜ'
          @players = Player.where('furigana LIKE ?', 'ぜ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぞ'
          @players = Player.where('furigana LIKE ?', 'ぞ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'だ'
          @players = Player.where('furigana LIKE ?', 'だ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'だ'
          @players = Player.where('furigana LIKE ?', 'だ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぢ'
          @players = Player.where('furigana LIKE ?', 'ぢ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'づ'
          @players = Player.where('furigana LIKE ?', 'づ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'で'
          @players = Player.where('furigana LIKE ?', 'で%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ど'
          @players = Player.where('furigana LIKE ?', 'ど%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ば'
          @players = Player.where('furigana LIKE ?', 'ば%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'び'
          @players = Player.where('furigana LIKE ?', 'び%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぶ'
          @players = Player.where('furigana LIKE ?', 'ぶ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'べ'
          @players = Player.where('furigana LIKE ?', 'べ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぼ'
          @players = Player.where('furigana LIKE ?', 'ぼ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぱ'
          @players = Player.where('furigana LIKE ?', 'ぱ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぴ'
          @players = Player.where('furigana LIKE ?', 'ぴ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぷ'
          @players = Player.where('furigana LIKE ?', 'ぷ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぺ'
          @players = Player.where('furigana LIKE ?', 'ぺ%')
        end

        if params[:sakuinsearch_columns].present? && params[:sakuinsearch_columns] == 'ぽ'
          @players = Player.where('furigana LIKE ?', 'ぽ%')
        end

    end
    
    def new
        @player = Player.new
    end
    
    def create
        player = Player.new(player_params)

        player.user_id = current_user.id

        if player.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @player = Player.find(params[:id])

        @comments = @player.comments
        @comment = Comment.new

        @ranks = @player.ranks
        @rank = Rank.new
    end

    def edit
        @player = Player.find(params[:id])
    end

    def update
        player = Player.find(params[:id])
        if player.update(player_params)
          redirect_to :action => "show", :id => player.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        tweet = Player.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end

    private

    def player_params
        params.require(:player).permit(:name, :furigana, :category, :belong, :league, :throws, :bats, :height, :weight, :birthday, :fyear, :cyear, :month, :date, :prefecture, :career, :subtitle1, :explanation, :subtitle2, :explanation2, :subtitle3, :explanation3, :summarytext, :injury, :max, :powerful, :control, :stamina, :breaking, :meet, :power, :running, :defence, :copy, :future, :created_at, :updated_at, tag_ids: [], mptag_ids: [], mfctag_ids: [], mfitag_ids: [], mfotag_ids: [], sptag_ids: [], sfctag_ids: [], sfitag_ids: [], sfotag_ids: [], wptag_ids: [], wfctag_ids: [], wfitag_ids: [], wfotag_ids: [], etag_ids: [], vtag_ids: [], vltag_ids: [], vlltag_ids: [], vutag_ids: [], vlrtag_ids: [], vrtag_ids: [], otag_ids: [])
    end
    
end
