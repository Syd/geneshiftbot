require "discordcr"
require "tail"

# a basic discord bot for pick up games of Geneshift
# create teams and spawn a server.
# a server config (config.ini) is generated at launch time with ECR
# https://crystal-lang.org/api/master/ECR.html


token = "<discordtoken>"
client_id = "<clientid>"
activechannel = "<channelid>"
command_prefix = "!"
game_size = 12
# how many seconds after the game ends to shut down the server
server[:timeout] = 180
# number of rounds the pick up game lasts for
server[:rounds] = 3
# gametype
server[:gametype] = 6
# number of bots
server[:bots] = 0

client = Discord::Client.new(token: token, client_id: client_id)

# process our commands and attempt to let the compiler assume typing.
def process_command(payload)
  case payload.content
  when "!join"
  when "!leave"
  when "!players"
  when "!help"
  end
end

# spawn a child process and watchdog, afterwards private message all players
# with the server join password.
# tail the logs for round limit and kill the child process after the timeout
def spawn_server
end

client.on_message_create do |payload|
  # restrict pickup commands to a dedicated channel
  if payload.channel_id == activechannel
    # ignore anything that doesn't begin with our command prefix
    if payload.content.starts_with? command_prefix
      process_command(payload)
    end
  end
end
