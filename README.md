

# events
`import "github.com/tendermint/go-events"`

* [Overview](#pkg-overview)
* [Index](#pkg-index)

## <a name="pkg-overview">Overview</a>
Pub-Sub in go with event caching




## <a name="pkg-index">Index</a>
* [type EventCache](#EventCache)
  * [func NewEventCache(evsw Fireable) *EventCache](#NewEventCache)
  * [func (evc *EventCache) FireEvent(event string, data EventData)](#EventCache.FireEvent)
  * [func (evc *EventCache) Flush()](#EventCache.Flush)
* [type EventCallback](#EventCallback)
* [type EventData](#EventData)
* [type EventSwitch](#EventSwitch)
  * [func NewEventSwitch() EventSwitch](#NewEventSwitch)
* [type Eventable](#Eventable)
* [type Fireable](#Fireable)


#### <a name="pkg-files">Package files</a>
[event_cache.go](/src/github.com/tendermint/go-events/event_cache.go) [events.go](/src/github.com/tendermint/go-events/events.go) [log.go](/src/github.com/tendermint/go-events/log.go) 






## <a name="EventCache">type</a> [EventCache](/src/target/event_cache.go?s=152:215#L1)
``` go
type EventCache struct {
    // contains filtered or unexported fields
}
```
An EventCache buffers events for a Fireable
All events are cached. Filtering happens on Flush







### <a name="NewEventCache">func</a> [NewEventCache](/src/target/event_cache.go?s=275:320#L5)
``` go
func NewEventCache(evsw Fireable) *EventCache
```
Create a new EventCache with an EventSwitch as backend





### <a name="EventCache.FireEvent">func</a> (\*EventCache) [FireEvent](/src/target/event_cache.go?s=534:596#L19)
``` go
func (evc *EventCache) FireEvent(event string, data EventData)
```
Cache an event to be fired upon finality.




### <a name="EventCache.Flush">func</a> (\*EventCache) [Flush](/src/target/event_cache.go?s=773:803#L26)
``` go
func (evc *EventCache) Flush()
```
Fire events by running evsw.FireEvent on all cached events. Blocks.
Clears cached events




## <a name="EventCallback">type</a> [EventCallback](/src/target/events.go?s=4182:4221#L175)
``` go
type EventCallback func(data EventData)
```









## <a name="EventData">type</a> [EventData](/src/target/events.go?s=236:287#L4)
``` go
type EventData interface {
}
```
Generic event data can be typed and registered with tendermint/go-wire
via concrete implementation of this interface










## <a name="EventSwitch">type</a> [EventSwitch](/src/target/events.go?s=553:760#L19)
``` go
type EventSwitch interface {
    Service
    Fireable

    AddListenerForEvent(listenerID, event string, cb EventCallback)
    RemoveListenerForEvent(event string, listenerID string)
    RemoveListener(listenerID string)
}
```






### <a name="NewEventSwitch">func</a> [NewEventSwitch](/src/target/events.go?s=902:935#L36)
``` go
func NewEventSwitch() EventSwitch
```




## <a name="Eventable">type</a> [Eventable](/src/target/events.go?s=371:433#L10)
``` go
type Eventable interface {
    SetEventSwitch(evsw EventSwitch)
}
```
reactors and other modules should export
this interface to become eventable










## <a name="Fireable">type</a> [Fireable](/src/target/events.go?s=483:551#L15)
``` go
type Fireable interface {
    FireEvent(event string, data EventData)
}
```
an event switch or cache implements fireable














- - -
Generated by [godoc2md](http://godoc.org/github.com/davecheney/godoc2md)
# tendermint-go-events
