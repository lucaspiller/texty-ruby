# Texty (Ruby Gem)

A Ruby gem interface to the Texty application.

## What is Texty?

At the moment Texty doesn't exist, however it is currently in development. The idea behind Texty is to provide a programatic way to send and receive SMS messages from a mobile device in order to automate testing of SMS services. As I said it doesn't yet exist, however this is going to be the interface to it. Feel free to contribute on how you think this should work!

## Receiving an SMS

    Texty.obtain do |device|
      User.create!(:name => 'Bob', :msisdn => device.msisdn, :operator => device.operator)
      
      device.receive_sms do |sms|
        sms.originator.should == '66666'
        sms.body.should == 'Thanks Bob, you are now registered!'
      end
    end

## Sending an SMS

    Text.obtain do |device|
      device.send_sms do |sms|
        sms.destination = '6666'
        sms.body = 'Hi there!'
      end
    end

## Obtaining a specific operator

Assuming the operator can be found:

    Texty.obtain('Three-UK') do |device|
      puts device.operator
    end
    # Three-UK

Otherwise you get an error:

    Texty.obtain('JibbaJabber-UK') do |device|
      puts device.operator
    end
    # raises DeviceNotFound

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests. Pull requests without tests will be ignored.
* Send me a pull request. Bonus points for topic branches.

## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type">Texty (Ruby Gem)</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/lucaspiller/texty-ruby" property="cc:attributionName" rel="cc:attributionURL">Luca Spiller</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/lucaspiller/texty-ruby" rel="dct:source">github.com</a>.<br />Permissions beyond the scope of this license may be available at <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/lucaspiller/texty-ruby" rel="cc:morePermissions">https://github.com/lucaspiller/texty-ruby</a>.
