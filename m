Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 861443B459
	for <lists+nbd@lfdr.de>; Mon, 10 Jun 2019 14:07:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4DE8C2035D; Mon, 10 Jun 2019 12:07:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 10 12:07:05 2019
Old-Return-Path: <mkletzan@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DE09C201F7
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Jun 2019 12:06:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mSiKtJ_pbjgA for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Jun 2019 12:06:53 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 780BA20358
	for <nbd@other.debian.org>; Mon, 10 Jun 2019 12:06:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DF5081E03;
	Mon, 10 Jun 2019 12:06:50 +0000 (UTC)
Received: from caroline (unknown [10.43.2.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB54360856;
	Mon, 10 Jun 2019 12:06:49 +0000 (UTC)
Received: by caroline (Postfix, from userid 1000)
	id 9F555120035; Mon, 10 Jun 2019 14:06:48 +0200 (CEST)
Date: Mon, 10 Jun 2019 14:06:48 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org,
	w@uter.be, eblake@redhat.com
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190610120648.GC29602@wheatley>
References: <20190528103537.15081-1-rjones@redhat.com>
 <20190528103537.15081-2-rjones@redhat.com>
 <20190605171920.GB12691@redhat.com>
 <20190610111932.GG3888@redhat.com>
 <20190610114326.GE7809@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <20190610114326.GE7809@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 10 Jun 2019 12:06:50 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IY-3IPUnHvD.A.jVG.pfk_cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/567
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190610120648.GC29602@wheatley
Resent-Date: Mon, 10 Jun 2019 12:07:05 +0000 (UTC)


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2019 at 12:43:26PM +0100, Daniel P. Berrang=E9 wrote:
>On Mon, Jun 10, 2019 at 12:19:32PM +0100, Richard W.M. Jones wrote:
>> On Wed, Jun 05, 2019 at 06:19:20PM +0100, Daniel P. Berrang=E9 wrote:
>> > > +* `tls-verify-peer`: This optional parameter may be `0` or `1` to
>> > > +  control whether the client verifies the server's identity.  By
>> > > +  default clients SHOULD verify the server's identity if TLS is
>> > > +  negotiated and if a suitable Certificate Authorty is available.
>> >
>> > I'd prefer if this is a "MUST" for the default value to be 1, if
>> > omitted.
>>
>> "SHOULD" here means that's what implementations ought to do, and most
>> will do it by default, but it leaves some leeway for implementations
>> which cannot or choose not to verify the peer for whatever reason
>> (even though we know that is unsafe in some MITM cases).  I've tried
>> to avoid mandating implementations except when it's absolutely
>> necessary.
>>
>> > > +### TLS certificates directory
>> > > +
>> > > +The `tls-certificates` parameter (if used) refers to a directory
>> > > +containing the Certificate Authority (CA) certificates bundle, clie=
nt
>> > > +certificate, client private key, and CA Certificate Revocation List.
>> > > +
>> > > +These are all optional except for the CA certificates bundle.
>> > > +
>> > > +The files in this directory SHOULD use the following names:
>> > > +
>> > > +    Filename               Usage
>> > > +    --------------------------------------------------
>> > > +    ca-cert.pem            CA certificates bundle
>> > > +    client-cert.pem        Client certificate
>> > > +    client-key.pem         Client private key
>> > > +    ca-crl.pem             CA Certificate Revocation List
>> >
>> > QEMU suports a "dh-params.pem" file for the diffie-hellman parameters.
>> >
>> > With PSK, it uses a "tls-creds-psk" file with optional dh-params.pem
>> > file too.
>>
>> This is really the crux of the issue that prevents me from getting a
>> submitting draft.
>>
>> I think there are three ways forward:
>>
>> (1) Mandate the QEMU-style certificates directory, as outlined above
>> (with Dan's amendment).  This requires a small change to libnbd.  It
>> is compatible with nbd-client albeit reducing the "flexibility" os
>> what nbd-client allows.
>>
>> (2) Add tls-* parameters for each individual file.  Requires
>> substantial changes to QEMU and libnbd.  Flexible but you're going to
>> end up with very long TLS URIs.
>>
>> (3) Drop all the TLS parameters related to the certificate and key
>> names / paths.  It's a free-for-all until someone else decides what's
>> best to do.
>
>The tension in these choices is a reflection on two different views on
>what the URI should be used for
>
>  a) URI as a way to identify what server to connect to
>
>  b) URI as a way to identify what server to connect to *AND*
>     express tunable params used to create the connection
>
>By providing the TLS credential path parameters we're moving into the
>territory of option b).
>
>Stuff required for option a) is pretty unambiguous & easily standardized,
>but option b) is likely always going to be painful as you venture into
>terrority of things which are specific to the implementation choices.
>
>For example if an application uses NSS instead of GNUTLS, then the
>notion of certificates paths is very different - NSS uses a completely
>different data file format for storing certs. A single DB containing
>all data, not individual PEM files. Even with individual PEM files, as
>discussed here, we have potential application specific naming needs.
>
>To me this suggests we should stick to option a) and only document the
>information needed to identify the server.
>

When comparing to other URI specifications, option a) seems more suiting as
well.  If you (or anyone else) really want the connection parameters to be
provided in the same string, then that can still be adapted later on as this
specification is not limiting in that regard.

Martin

>Regards,
>Daniel
>--=20
>|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrang=
e :|
>|: https://libvirt.org         -o-            https://fstop138.berrange.co=
m :|
>|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrang=
e :|

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAlz+R9gACgkQCB/CnyQX
ht1ryxAAnnIfG98ZPDEjyoyl44/vbM8Kfa06jgcVQYKxYB+NXdpnw2b90MJwNTan
Ct8lNIVZBIho7iM9cZgjWZI26etgPGE2s0g+/5P4GfWSLtXWbH+b2d9ppll0cWJR
MpxDVL80Df7yDmpuwIaxT1mDPz00lo0VbMbBuszoVxRFJvJiXOpnKm5LWMU5mGLK
hV3WhVGhb1DgFrwjgBvNVzDHBCOPMJZs4Obl5wzhzL5/ILbGI8We+XUArZismAEv
n5FzbBZosucgZA2/xkY1XPZBTX+LNgW1p47RLGa18EX2SASUOeMdHUqlZ8nfvglX
rTbWvSCzXiXYGBB12hdJLrpkSmjTZEGdfjbNbX0VdmwWHiHxEAbOb8b32kb+wjKl
NZJdmOqglPzy7ts/wLtBbmktFsVWkNA+yu8aNvLN0ULBf++NkyQrs4BFs6bZF2YP
ow+WTB5cVXlm0ivQp6nXbm0JutF+pcjCEvRSLjLoX42CUy3FH9gs9u2SGSYWFmE1
g5ODRo7naIGW1l0dSJlDM73pZcIG4nBf0WPNTt3am2pTV48blUOQK1N6gmVmmkJB
/twqXPPbxws6KK1Fkz3UwzMVSvl8z9UB3JoCXBsGBj30Ctvj28wce0zC6niFDoiT
VdfGO9ft+ztDvwqzJt76GvZpzhJ7JrHrh5mtf38Is9/c5/FPocc=
=7bOT
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

