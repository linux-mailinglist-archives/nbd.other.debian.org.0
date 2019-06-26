Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7265641D
	for <lists+nbd@lfdr.de>; Wed, 26 Jun 2019 10:13:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1DAAD205B2; Wed, 26 Jun 2019 08:13:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 26 08:13:00 2019
Old-Return-Path: <mkletzan@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2AE9B20387
	for <lists-other-nbd@bendel.debian.org>; Wed, 26 Jun 2019 08:12:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fBNLE2Tqn_zx for <lists-other-nbd@bendel.debian.org>;
	Wed, 26 Jun 2019 08:12:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C045B2058D
	for <nbd@other.debian.org>; Wed, 26 Jun 2019 08:12:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53F57308FB9D;
	Wed, 26 Jun 2019 08:12:45 +0000 (UTC)
Received: from caroline (unknown [10.43.2.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 169EA5D717;
	Wed, 26 Jun 2019 08:12:45 +0000 (UTC)
Received: by caroline (Postfix, from userid 1000)
	id D30FF120106; Wed, 26 Jun 2019 10:12:43 +0200 (CEST)
Date: Wed, 26 Jun 2019 10:12:43 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Wouter Verhelst <wouter@grep.be>,
	"Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org,
	w@uter.be, berrange@redhat.com
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190626081243.GI21751@wheatley>
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com>
 <20190611142259.GG29602@wheatley>
 <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
 <20190611173543.msj6s6fwambak5wu@grep.be>
 <d5c7b5ea-bef2-fa46-2206-8f0c2b464b49@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4LwthZj+AV2mq5CX"
Content-Disposition: inline
In-Reply-To: <d5c7b5ea-bef2-fa46-2206-8f0c2b464b49@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 26 Jun 2019 08:12:45 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pB0ZBgGwvOC.A.bzH.MkyEdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/598
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190626081243.GI21751@wheatley
Resent-Date: Wed, 26 Jun 2019 08:13:00 +0000 (UTC)


--4LwthZj+AV2mq5CX
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2019 at 08:44:27PM -0500, Eric Blake wrote:
>On 6/11/19 12:35 PM, Wouter Verhelst wrote:
>
>> I think you're overthinking it here. We could just say that a client
>> which does not recognize a parameter should just balk? After all, a URI
>> is something that in most cases would be passed on the command line, or
>> some such; the feedback to the user would be fairly quick. Additionally,
>> I can't think of any extra feature that we might want to add to the URL
>> but which might be optional...
>
>And RFC 3986 states:
>
>"   When presented with a URI that violates one or more scheme-specific
>   restrictions, the scheme-specific resolution process should flag the
>   reference as an error rather than ignore the unused parts; doing so
>   reduces the number of equivalent URIs and helps detect abuses of the
>   generic syntax, which might indicate that the URI has been
>   constructed to mislead the user (Section 7.6).
>"
>
>So recommending that clients reject a URI they cannot recognize is sane.
>
>It also turns out that RFC 3986 permits:
>
>nbd:unix:/path/to/socket
>
>as a valid URI in the nbd: scheme with no authority and a relative path
>(different than nbd+unix:///export?socket=3D/path/to/socket as a URI with
>an empty authority).  However, I'd recommend that you document it as
>being a scheme-specific restriction that we require the
>scheme://[authority][/abs/path] form, especially since the former string
>(used by qemu prior to the introduction of its nbd+unix: scheme) can end
>up trying to connect over TCP to the export named 'unix:/path/to/socket'
>on localhost port 10809 rather than the intended connection to the empty
>string export at a Unix socket at '/path/to/socket'.
>

Thank you for formalizing the issue I faced.  This could certainly be an is=
sue,
especially when nbd:unix:/path/to/socket is used in some programs.

>If you are using libxml2 xmlParseURI, you can tell the difference on
>which form was used based on whether path is empty or begins with '/'
>(good) vs. beginning with anything else, prior to the step where we
>discard a leading '/'.
>
>--=20
>Eric Blake, Principal Software Engineer
>Red Hat, Inc.           +1-919-301-3226
>Virtualization:  qemu.org | libvirt.org
>




--4LwthZj+AV2mq5CX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAl0TKPsACgkQCB/CnyQX
ht0h8g/9EJdVp79wngjnpetm+AHXgydGIO0tZoDzOPke81o/c3RSDSKDRhOEYGa8
ULRVjVpri3bY6I0GVnnSZZZ+ggS43NW8eYAzKTrRP544M//GAF7mO4zm/aRMG14G
bS+eMN1rJlls2GK9Dmqi1AVwsDwXQMXRzjfcrm9CB5oMIUfJu5avsKsJI2Y2yLGJ
m7FaTKNT5ViCWzrv+Fn2aoOPHgK+TunsL2a45PxZENZbVs8UEQJtI8KmBUIHXLgB
k+sQTxGn55zOWT5w5vlbL/yt3wGvN6zPvsOQfUWlaL3jr1RwDjBsAbEEZria+Dvm
UUJ1lsmDbT9fFdjfbEh4no+2+mRL9+wgwsbILWQVDzb2XqXWNaCRNG85FLXKVt8U
ECVxHNXYpHiwbF2CdnbjN3SCWgYglziOs0IWcM5I/17towgVLZsq2jwuo0uunwMe
GBPm45cWkHCytH6+LOo3n8wji3HkexDClP6xECBylgocwA9Fyjkp+2F8okB3JE7T
y53xxIIZM/BqgnPh5w6wqg8+P7JCImpUJKBzOrYwxcT+/UlrIi8QiLfwvvSusBuy
me+LtWM8HX47231A7bk+EgefHrW84n42hP6HZi2pgPvgTebEPm9byb1Wl+KN1h0x
nLvVUczGEhotz3LzOckAKxLxNQ2rf8fnU7hy3HgX/h1f9kH4pos=
=CrzX
-----END PGP SIGNATURE-----

--4LwthZj+AV2mq5CX--

