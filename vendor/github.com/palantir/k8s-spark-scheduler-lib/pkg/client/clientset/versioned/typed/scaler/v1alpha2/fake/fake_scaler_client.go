// Code generated by client-gen. DO NOT EDIT.

package fake

import (
	v1alpha2 "github.com/palantir/k8s-spark-scheduler-lib/pkg/client/clientset/versioned/typed/scaler/v1alpha2"
	rest "k8s.io/client-go/rest"
	testing "k8s.io/client-go/testing"
)

type FakeScalerV1alpha2 struct {
	*testing.Fake
}

func (c *FakeScalerV1alpha2) Demands(namespace string) v1alpha2.DemandInterface {
	return &FakeDemands{c, namespace}
}

// RESTClient returns a RESTClient that is used to communicate
// with API server by this client implementation.
func (c *FakeScalerV1alpha2) RESTClient() rest.Interface {
	var ret *rest.RESTClient
	return ret
}