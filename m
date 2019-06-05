Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC5236359
	for <lists+nbd@lfdr.de>; Wed,  5 Jun 2019 20:28:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 51237203A5; Wed,  5 Jun 2019 18:28:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  5 18:28:12 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MDO_CABLE_TV3,MURPHY_DRUGS_REL8,PGPSIGNATURE,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E18C82039F
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Jun 2019 18:28:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.38 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5, MDO_CABLE_TV3=0.5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9VrWFe8bLjbd for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Jun 2019 18:27:59 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D679B20379
	for <nbd@other.debian.org>; Wed,  5 Jun 2019 18:27:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BE8B3082B6B;
	Wed,  5 Jun 2019 18:27:50 +0000 (UTC)
Received: from [10.3.116.85] (ovpn-116-85.phx2.redhat.com [10.3.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A14C568378;
	Wed,  5 Jun 2019 18:27:49 +0000 (UTC)
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, w@uter.be, mkletzan@redhat.com
References: <20190528103537.15081-1-rjones@redhat.com>
 <20190528103537.15081-2-rjones@redhat.com>
 <20190605171920.GB12691@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <3b439521-a1c9-5409-9694-31d50e048dd7@redhat.com>
Date: Wed, 5 Jun 2019 13:27:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605171920.GB12691@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3hRMPqfWo1C6djssIndUYPhOgoStMP0xo"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 05 Jun 2019 18:27:50 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DfKI0zcBudP.A.gdB.8mA-cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/562
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3b439521-a1c9-5409-9694-31d50e048dd7@redhat.com
Resent-Date: Wed,  5 Jun 2019 18:28:12 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3hRMPqfWo1C6djssIndUYPhOgoStMP0xo
Content-Type: multipart/mixed; boundary="cOb2q8HxLR6hagHIWaC11uiAsfieEx2ff";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, w@uter.be, mkletzan@redhat.com
Message-ID: <3b439521-a1c9-5409-9694-31d50e048dd7@redhat.com>
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
References: <20190528103537.15081-1-rjones@redhat.com>
 <20190528103537.15081-2-rjones@redhat.com>
 <20190605171920.GB12691@redhat.com>
In-Reply-To: <20190605171920.GB12691@redhat.com>

--cOb2q8HxLR6hagHIWaC11uiAsfieEx2ff
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/5/19 12:19 PM, Daniel P. Berrang=C3=A9 wrote:
> On Tue, May 28, 2019 at 11:35:37AM +0100, Richard W.M. Jones wrote:
>> For further information about discussion around this standard, see
>> this thread on the mailing list:
>> https://lists.debian.org/nbd/2019/05/msg00013.html
>>

>=20
>> +## NBD URI scheme
>> +
>> +One of the following scheme names SHOULD be used to indicate an NBD U=
RI:
>> +
>> +* `nbd`: NBD over an unencrypted or opportunistically TLS encrypted
>> +  TCP/IP connection.
>> +
>> +* `nbds`: NBD over a TLS encrypted TCP/IP connection.  If encryption
>> +  cannot be negotiated then the connection MUST fail.
>> +
>> +* `nbd+unix`: NBD over a Unix domain socket.  The query parameters
>> +  MUST include a parameter called `socket` which refers to the name o=
f
>> +  the Unix domain socket.
>=20
> This should mention "nbds+unix", since it is valid to run TLS over a
> UNIX socket to. This does have complications for x509 though, because
> you then need to explicitly pass the hostname to validate the cert
> against. For PSK it is trivial though.
>=20
> The rationale for TLS over UNIX sockets, is that the UNIX socket may
> simply be a local tunnel to the real TCP connection.

qemu-nbd does not yet support TLS over Unix, but bringing it into line
with what we document here should fill in that gap.

>> +## NBD URI authority
>> +
>> +The authority field SHOULD be used for TCP/IP connections and SHOULD
>> +NOT be used for Unix domain socket connections.
>> +
>> +The authority field MAY contain the `userinfo`, `host` and/or `port`
>> +fields as defined in [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt)=

>> +section 3.2.
>> +
>> +The `host` field may be a host name or IP address.  Literal IPv6
>> +addresses MUST be formatted in the way specified by
>> +[RFC 2732](https://www.ietf.org/rfc/rfc2732.txt).
>> +
>> +If the `port` field is not present then it MUST default to the NBD
>> +port number assigned by IANA (10809).
>> +
>> +The `userinfo` field is used to supply a username for TLS
>> +authentication.  If the `userinfo` field is not present but is needed=

>> +by the client for TLS authentication then it SHOULD default to a loca=
l
>> +operating system credential if one is available.
>=20
> What do you mean by "TLS authentication" here ? This is the name used
> to lookup the PSK credentials when the PSK file contains many creds ?
>=20
> If so this probably needs explaining, since IIUC this use of many
> PSK creds in one file is not really a TLS thing, it is an impl
> choice of QEMU's PSK support.
>=20
> Using the URI authority section for passing "userinfo" feels like a
> bad idea though. Shouldn't we pass that as a parameter and keep the
> authority as the normal "hostname" semantics, or unused if no hostname
> is applicable.

If I'm understanding the intent, this is a difference between:

nbds://user@host/exportname
nbd+unix://user@/exportname?socket=3Dpath

vs.

nbds://host/exportname?tls_username=3Duser
nbd+unix:///exportname?socket=3Dpath&tls_username=3Duser

I don't have a strong preference at the moment.


>=20
>> +It is up to the NBD client what should happen if the authority field
>> +is not present for TCP/IP connections, or present for Unix domain
>> +socket connections.  Options might include failing with an error,
>> +ignoring it, or using defaults.

The userinfo field is part of the authority; so this is
self-contradictory if we want nbds+unix://username@/ for specifying the
tls username.


>> +
>> +On platforms which support Unix domain sockets in the abstract
>> +namespace, and if the client supports this, the `socket` parameter MA=
Y
>> +begin with an ASCII NUL character.  When the URI is properly encoded
>> +it will look like this:
>> +
>> +    nbd+unix:///?socket=3D%00/abstract
>=20
> In the abstract namespace, the entire 108 characters are significant.
> IOW, if you pass a 10 character abstract path you've got 98 NULs
> implicitly following that. We should document this, as it is a
> frequent interoperability screw up in apps to not take this into
> account.

Does the Linux kernel treat:

"\0a" length 2
"\0a\0...\0" length 108

as the same socket? If specifying an explicit shorter length has the
same effect as providing explicit NUL bytes in the padding of a longer
length, that's a little easier, but yes, documenting that any trailing
bytes must be initialized to 0 is worthwhile.

>> +If TLS encryption is to be negotiated then the following query
>> +parameters MAY be present:
>> +
>> +* `tls-type`: Possible values include `anon`, `x509` or `psk`.  This
>> +  specifies the desired TLS authentication method.  The client MAY
>> +  default to an authentication method based on which other `tls-*`
>> +  parameters are present.
>> +
>> +* `tls-certificates`: The path to the TLS certificates directory.
>> +
>> +* `tls-psk-file`: The path to the TLS-PSK key file.
>=20
> In QEMU, we don't accept a path to the PSK file, we take a path to
> a directory which contains "tls-creds-psk" and optionally also
> a "dh-params.pem" file.
>=20
> IOW, we just have a single "tls-creds-dir" parameter working the
> same way for PSK and x509. All that differs is what files are
> expected to be present.
>=20
> So this spec conflicts with QEMU's view of managing TLS creds
> files.

We could, of course, teach qemu to support whatever this spec ends up
with in addition to everything else; but there's also the point that the
qemu code uses a consistent model for TLS across multiple entities (not
just NBD, but also Spice, chardevs, ...), and then there's the question
of whether a compatibility hack should be global to all of them or just
to the NBD code.

>=20
>> +* `tls-hostname`: The TLS client hostname.
>=20
> We should document how this relates to the hostname in the URI
> authority. ie, if omitted the URI authority will be used instead.

If a Unix socket is using TLS, would we allow URI authority there?

>=20
>> +* `tls-verify-peer`: This optional parameter may be `0` or `1` to
>> +  control whether the client verifies the server's identity.  By
>> +  default clients SHOULD verify the server's identity if TLS is
>> +  negotiated and if a suitable Certificate Authorty is available.
>=20
> I'd prefer if this is a "MUST" for the default value to be 1, if
> omitted.
>=20
> Implementing TLS without implementing verification is nonsensical
> IMHO.

Indeed, safe by default is a better approach.

>=20
>> +### TLS certificates directory
>> +
>> +The `tls-certificates` parameter (if used) refers to a directory
>> +containing the Certificate Authority (CA) certificates bundle, client=

>> +certificate, client private key, and CA Certificate Revocation List.
>> +
>> +These are all optional except for the CA certificates bundle.
>> +
>> +The files in this directory SHOULD use the following names:
>> +
>> +    Filename               Usage
>> +    --------------------------------------------------
>> +    ca-cert.pem            CA certificates bundle
>> +    client-cert.pem        Client certificate
>> +    client-key.pem         Client private key
>> +    ca-crl.pem             CA Certificate Revocation List
>=20
> QEMU suports a "dh-params.pem" file for the diffie-hellman parameters.
>=20
> With PSK, it uses a "tls-creds-psk" file with optional dh-params.pem
> file too.
>=20
>> +## Other NBD URI query parameters
>> +
>> +Other query parameters SHOULD be ignored by the parser.
>> +
>> +## Clients which do not support TLS
>> +
>> +Wherever this document refers to encryption, authentication and TLS,
>> +clients which do not support TLS SHOULD give an error when
>> +encountering an NBD URI that requires TLS (such as one with a scheme
>> +name `nbds`).
>> \ No newline at end of file
>=20
>=20
> There ought to be a way to specify the TLS priority string to control
> what valid cipher settings are.
>=20
> Regards,
> Daniel
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--cOb2q8HxLR6hagHIWaC11uiAsfieEx2ff--

--3hRMPqfWo1C6djssIndUYPhOgoStMP0xo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlz4CaQACgkQp6FrSiUn
Q2pk2wf/ZG10OqnmpWMjbLo6O3JBlYXEFERC0IbvYW9k+Cb+2kv8jGpvKc4InGsC
yyRFZXNI1Dl5DHlFH6ITvRp9Qd4B7bRKQd9roSrQvgZgLosKNrv5PQ09QH46+kET
pjQfvPfgA9lBmNgc5BuNWwK+BUzSQENtdBb6eqetS+vhDx3CeQZCXnDEWzg21Qcy
1vmar5jQnzvVxESn6cSsMWnVc69PF7QqVK+S+JljHfB7tr2pZLVJQEuQVkW7G2HG
Bsx1U4V/peJC5l13IixAU6bat5SJ/KN0VPXJ6kGEUlgdSSuQEg/sJUcm0cac27dO
DzYtC+cMRS8rpbTg330cl36s0oR6tQ==
=H+48
-----END PGP SIGNATURE-----

--3hRMPqfWo1C6djssIndUYPhOgoStMP0xo--

