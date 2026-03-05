import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post
    var player: AVPlayer?
    var user: User?
    
    @State private var isLiked = false
    @State private var likeCount = 27
    
    init(post: Post, player: AVPlayer) {
        self.post = post
        self.player = player
    }
    
    var body: some View {
        ZStack {
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
            
            VStack {
                Spacer()
                
                HStack(alignment: .bottom) {
                    
                    VStack(alignment: .leading) {
                        Text("F")
                            .fontWeight(.semibold)
                        Text("3 12123 12 123")
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                        
                        Button {
                            withAnimation(.spring()) {
                                    isLiked.toggle()
                                    
                                    if isLiked {
                                        likeCount += 1
                                    } else {
                                        likeCount -= 1
                                    }
                                }
                        } label: {
                            VStack {
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(isLiked ? .red : .white)
                               
                                
                                Text("\(likeCount)")
                                    .font(.footnote)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text("27")
                                    .font(.footnote)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 22, height: 28)
                                .foregroundStyle(.white)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                        }
                    }
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
        .onTapGesture {
            switch player?.timeControlStatus {
            case .paused:
                player?.play()
            case .playing:
                player?.pause()
            case .waitingToPlayAtSpecifiedRate:
                break
            case nil:
                break
            @unknown default:
                break
            }
        }
    }
}

#Preview { FeedCell(post: Post( id: NSUUID().uuidString, videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"), player: AVPlayer()) }
