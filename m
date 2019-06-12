Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 706224317E
	for <lists+nbd@lfdr.de>; Wed, 12 Jun 2019 23:40:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3D76620423; Wed, 12 Jun 2019 21:40:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 12 21:40:31 2019
Old-Return-Path: <mkletzan@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9D3BC20403
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 Jun 2019 21:40:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mw-Pu8LFfyaT for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 Jun 2019 21:40:19 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D10B3203EA
	for <nbd@other.debian.org>; Wed, 12 Jun 2019 21:40:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1B38C1EB1F1;
	Wed, 12 Jun 2019 21:40:15 +0000 (UTC)
Received: from wheatley (ovpn-204-122.brq.redhat.com [10.40.204.122])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EC0A5C298;
	Wed, 12 Jun 2019 21:40:15 +0000 (UTC)
Received: by wheatley (Postfix, from userid 1000)
	id 8E6847E0068; Wed, 12 Jun 2019 23:40:13 +0200 (CEST)
Date: Wed, 12 Jun 2019 23:40:13 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org,
	w@uter.be, berrange@redhat.com
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190612214013.GC19349@wheatley>
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com>
 <20190611142259.GG29602@wheatley>
 <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline
In-Reply-To: <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 12 Jun 2019 21:40:15 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qzYb5l1DH2C.A.owH.PFXAdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/582
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190612214013.GC19349@wheatley
Resent-Date: Wed, 12 Jun 2019 21:40:31 +0000 (UTC)


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 11:31:08AM -0500, Eric Blake wrote:
>On 6/11/19 9:22 AM, Martin Kletzander wrote:
>> On Tue, Jun 11, 2019 at 12:53:30PM +0100, Richard W.M. Jones wrote:
>>> For further information about discussion around this standard, see
>>> this thread on the mailing list:
>>> https://lists.debian.org/nbd/2019/05/msg00013.html
>>>
>
>>> +## Other NBD URI query parameters
>>> +
>>> +Clients SHOULD prefix experimental query parameters using `x-`.=A0 This
>>> +SHOULD NOT be used for query parameters which are expected to be
>>> +widely used.
>>> +
>>> +Any other query parameters which the client does not understand SHOULD
>>> +be ignored by the parser.
>>> +
>>
>> Everything seems good to me, I just have one "idea".=A0 I, however, am n=
ot
>> sure
>> whether it might be helpful or utterly stupid.=A0 But since I would never
>> forgive
>> myself not mentioning it, here goes:
>>
>> TL;DR: Is it worth to care about
>> versioning/some-kind-of-forward-compatibility?
>
>That may actually be a good idea.
>
>>
>> If there is a new query parameter added later on, which would significan=
tly
>> change the behaviour (or security), then a client might want to depend
>> on it not
>> being ignored by the parser (e.g. if just ignoring it would cause a
>> security
>> concern).
>>
>> What I thought of would be another parameter that would specify which ot=
her
>> parameters must be supported, so that the client quits if any of them is
>> unknown.=A0 On the other hand it should be perfectly fine to make sure n=
ew
>> enough
>> version of the client is used.
>
>So, you're asking for some way to know that ?foo=3Dbar is supported by the
>client, by having a way to fail if the client doesn't know how to parse
>the foo query.  What if we document mandatory support for a parameter
>'?features=3Dcomma,list,of,names', where a client MUST fail to parse the
>URI if it does not recognize one of the feature names from the list
>given to features?  Then we can have:
>
>nbd://host/?foo=3Dbar
> - okay to ignore query foo=3D as unknown
>nbd://host/?foo=3Dbar&features=3Dfoo
> - client MUST fail to parse URI unless it also knows how to parse the
>foo query parameter
>
>The initial set of features mandated by the NBD URI spec is 'features'
>for self-description, as well as 'socket' for Unix but not necessarily
>TCP.  Then the queries '?features=3D' and '?features=3Dfeatures' must both
>succeed, the query '?features=3Dsocket' depends on the scheme, and any
>other '?features=3D...' query becomes a feature probe.
>

That is almost identical to what I had in mind.

To be honest I cannot think of anything for which this might be needed (apa=
rt
=66rom tls-verify-peer which would have security implications).  But one ne=
ver
knows and I very well know the feeling of "well, if we added _this_ harmless
thing back in the day, we wouldn't need to deal with all _that_".  And it's=
 a
basically a type of thing that needs to be added right from the start, othe=
rwise
it doesn't make sense.

On the other hand this is just a URI and there are already some clients that
accept some variations of it, so it might be too late anyway.

Anyway, thanks for elaborating on the topic.

>--
>Eric Blake, Principal Software Engineer
>Red Hat, Inc.           +1-919-301-3226
>Virtualization:  qemu.org | libvirt.org
>




--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAl0BcT0ACgkQCB/CnyQX
ht3tsA//ZGJP8A3AjwJSDAS0Zy3gUrS3fkfQjziw76al5N5C9bexgK96kiR46C/v
UJZy354we+YhuaGi555oLtsyUIhYCDdeAAhWNaLwh/hNze6noiCtbitCM53cOGvA
i6XZB6k6X15LOn0YgRmmj16KwjvIL3qovVWQ0tH5gpyJ6tQENsXRJCS8258m3e2V
PBcgWw+pydQQY3EezLNIp0JlpjB3jGeToT7PBd4Js+NGHc7ULQ64nF976MzlAJ3S
X4ft4xtanC2VwN89uUwEB5GmRJT8igIDr9fNqZLHsO5Y4YVPqJe51kmhM5jkTNFS
xlPjmW+6Jsj022r/ILWdyZLZ1cbX78gR5XqUT7/pJa+owouStoW5tGs58u1pc5sd
QtG30w0iu/5onj5KeIWZJIx17XTS9fbiO8wOpft4fnmQ9s73BXWkt3XntWF9wkdC
/XhUPCzGkgI85ZIRgx8/uTEnisVo+hapOl0xEnh3U74aHDvsO4/JjcNFmvRWfqiv
WB87fc/RrioBUB1Nn4xpq8HkD0vfbMtTh1t6eGYlH5vi+TtAyP3D9SWF8oeLFzY2
5wRqJkUW1DVSatOl8oj90efLW2ikpuk99fG44Doa/xZ3A7VGAaKGXjZWpzIDS/3a
9hzgFE0LH7izR6DRDVlHrEDt9aqvt5izLkFwRqU8xsMxB+IosO0=
=0uk2
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--

