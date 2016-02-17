require 'json'
def get_flags(workspace, scheme, sdk, configuration)
    flags = []
    flags << "-workspace '#{workspace}'"
    flags << "-scheme '#{scheme}'"
    flags << "-sdk '#{sdk}'"
    flags << "-configuration '#{configuration}'"
    flags
end

def project_settings(workspace, scheme, sdk, configuration)

    flags = get_flags(workspace, scheme, sdk, configuration)
    puts "----------------------------------------------------------------"
    puts " READING SETTINGS @#{scheme}(#{sdk})-#{configuration}"
    # Get settings from xcodebuild -showBuildSettings
    xcodebuild_settings         = {}
    xcodebuild_settings_output  = %x[xcodebuild #{flags.join(' ')} -showBuildSettings]
    xcodebuild_settings_lines   = xcodebuild_settings_output.split(/\n/)
    xcodebuild_settings_lines.each do |line|
        case line
            # Avoid the first line (it's a comment)
            when /Build settings from command line:/
            else
                key, value = line.split(/\=/).collect(&:strip)
                xcodebuild_settings[key] = value
        end
    end
    puts " SETTINGS READ"
    puts "----------------------------------------------------------------"
    xcodebuild_settings
end

puts project_settings("charla.xcworkspace", "dummyproject", "iphonesimulator", "Debug").to_json
