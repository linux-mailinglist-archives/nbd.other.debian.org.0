Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579AAA98A0
	for <lists+nbd@lfdr.de>; Mon,  5 May 2025 18:20:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 24EDD20494; Mon,  5 May 2025 16:20:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May  5 16:20:23 2025
Old-Return-Path: <berend@deschouwer.co.za>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	PGPSIGNATURE,RCVD_IN_DNSWL_NONE,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SARE_MSGID_LONG40 autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4804420483
	for <lists-other-nbd@bendel.debian.org>; Mon,  5 May 2025 16:20:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.461 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SARE_MSGID_LONG40=0.637]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ms9MI57RAMsK for <lists-other-nbd@bendel.debian.org>;
	Mon,  5 May 2025 16:20:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "mailout.proton.ch", Issuer "mailout.proton.ch" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4DFAB2048B
	for <nbd@other.debian.org>; Mon,  5 May 2025 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=deschouwer.co.za;
	s=protonmail3; t=1746461979; x=1746721179;
	bh=CeXVPJfBCH/mqS8rLxe564xAXTXRh6O6nwS6bThRe4w=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=xoxAeFctcKxy771WxgPR1kOOF/u6C7dxdAAnUub10RENuuuVBQIBmkjkAd8ZCqa7w
	 X808QIpWAS2d0dHxm5iyQH4GxGYyy8bWvJJvxHpl2WES00RrFgcEflwBWxpHi48mKX
	 XexXsvB1VR4vD0yVHhHEkHMj09n7Vy78ERzcd4DJnywZkIUqF3xrlzaH9SnYamGFzF
	 40tfCxTg3BjrB2jdi9N+FNruta0H4XkGu6O4+U4kVH6I2jSNSLsWnWTDtPGZfYXT4t
	 P7uKzA8fkjj4MjOIkvJYMPGF1ptER9G/uaonrZ7GGn+1aMzRbo4Kbp5lp6iGYgKztY
	 6lqEEKOqyT4pw==
Date: Mon, 05 May 2025 16:19:35 +0000
To: nbd@other.debian.org
From: berend <berend@deschouwer.co.za>
Subject: nbd copy-on-write corruption
Message-ID: <1b35de1e82510f089317f722252ddba8502261c3.camel@deschouwer.co.za>
Feedback-ID: 50941660:user:proton
X-Pm-Message-ID: 2680026e01a4b8804d6acd10b18c0ebb145173c5
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------84c79caabcbe2db15b65db0f5c6707ddef25aa1596c386cb9406a4f6f891f9ca"; charset=utf-8
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wNx72jOE00K.A.qhGG.HVOGoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3374
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1b35de1e82510f089317f722252ddba8502261c3.camel@deschouwer.co.za
Resent-Date: Mon,  5 May 2025 16:20:23 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------84c79caabcbe2db15b65db0f5c6707ddef25aa1596c386cb9406a4f6f891f9ca
Content-Type: multipart/mixed;
 boundary=9eaffb7cc3902957a7a98ec6e210bdceb0a6e910934e03ad62b2dbbaa959
Message-ID: <1b35de1e82510f089317f722252ddba8502261c3.camel@deschouwer.co.za>
Subject: nbd copy-on-write corruption
From: berend <berend@deschouwer.co.za>
To: nbd@other.debian.org
Date: Mon, 05 May 2025 18:19:27 +0200
Autocrypt: addr=berend@deschouwer.co.za; prefer-encrypt=mutual;
 keydata=mQINBFWKkUEBEADXuiEYW1YIgNnrazEo/0zelTzxbHCG/wWxn7ASud8xHL1jqZK5qxQS/
 6WRbnQv5c5DPvk1Of6E/2XVsFUQJgR1YFxGtNt1QAl5R0vj7rvr8nBbeQhcmHsvwGpT7abkevWFvm
 cHbNKfXbc/sfDrCMotRFQBohc7oyo+NzOJOQpJqCbzwk+kVmVhVHpw8YzvnD2sVDqbQOxtWmrcofm
 9Db28NE0NcN2P9ABbNJut1QUZWtZ1lmW6ryhgKrC4uxSz/YNcc5zs2Z761SGKOSY8PVzvVkLbK9fb
 dY7jcgGCFd6GRYOB2I3B7CO9uafuToCDyhlqlugWXpGoA5B7o/a4Z1b7qlNsEmqlGh+eD94H8M/LW
 8dwYNRIoUNYIayRF1OQprc5Pz3iCxaonoIiGfxGZqNKT9QWoIg8rOC08tcr8uj4m1RjJrszSjtkws
 om0UwpBygHe/3Bp4xZSxgafMw6dGSKRsDTAHj2FJFWctNluY4jvxRX7CuW59Q35JIE8m+OgYbgLkG
 QfEdUyhcRqB0+VR2WRlX5sKUZkWg1AhgcL7FimNll3f06ye/uzbraUYHX7xc3v5CJ2Z6wx6MphZzh
 hxuBqLcYJEbN9fNsevTOYkEQIsGC7NWoT2hy3ujeYBPj3co2Nd4iWO9tpysLZ8gK15/dNjMBTsprS
 +9RPqgz5BtFmwARAQABtCxCZXJlbmQgRGUgU2Nob3V3ZXIgPGJlcmVuZEBkZXNjaG91d2VyLmNvLn
 phPokCOAQTAQIAIgUCVYqRQQIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ227gcZOAoOn
 Xdg/9EFdRr/XtOYbBeltb0sNHaSP7S4vklqcAtOntTYV3yMFNv9XBXXvFSKaGl0m5LheNAkIu/YbA
 dGXySzNUd7Wsfyb+23iq5UKGt+wD+RocLZY094uAKcQQTZwJKTw4tKIgN4qBtOaNiJwLursNZYAP7
 JIJFPQY55pa+yec3jxfTX0a7ruiecosmzavQ182V+Ldev2korGvY1cz43rP8xiL1DjtcBUneigbj5
 +N0Z8UljnR6QkSRuajdsGBAXHmkOsBV/o8M8vFWa8N83us1Gky5K54xQOaVyNRVrR4EISv8y0i33r
 wGYvPBD+RKaLacuKb8+8KNVuQ5M0v+4pGr/FeXpP+nPzVDfbZZhX1iweQ069LKa9ref8qEw4VVt7A
 uYFSweHVMICA0ZGyKJ5hZz7LdI0vAFANyUt0KoWeeK69xik8rvF75eo4fz/WJtf/AdnCuYp60obox
 /sJA7KrZrWQNbDclJefiSZV7tuHh7jLJqQufkm5D5gowAAo5grM/6WANHVw5iojM/UG6f0+tFZXgF
 Myk2JZy9c2s8VQgI2UzrbU8JsCtdDjBUSTC64R7klvV5bku31Am3RPC29l1hfY+3ULg4w8mmpJ28p
 q+/z0oKH8CwyicuFPFBG95ln/7tte4ifWkfzML8Oh2bpuKEb2PWR44sQ1Zq8+IAjS2XwL454=
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0

--9eaffb7cc3902957a7a98ec6e210bdceb0a6e910934e03ad62b2dbbaa959
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have a simple test case where nbd corrupts the date read back if
copyonwrite=3Dtrue, and another one if sparse_cow=3Dtrue.

I also have patches that I believe fix this.


For the first case, it's enough to read and write more than one
sequential block.  The second and subsequent blocks read will read into
the wrong offset of the buffer, and copy invalid data to the client.

I use a 4096 block size in this example, but I've used others.  I did
that to match the filesystem, but for the test I don't even need a
filesystem.

The test:

export OFFSET=3D0
export COUNT=3D3 # anything >=3D 1
dd if=3D/dev/urandom of=3Dtestdata bs=3D4096 count=3D$COUNT # random data
dd if=3Dtestdata of=3D/dev/nbd0 bs=3D4096 seek=3D$OFFSET count=3D$COUNT
dd if=3D/dev/nbd0 of=3Dcompdata bs=3D4096 skip=3D$OFFSET count=3D$COUNT
sum testdata compdata

The data will be different.

If the kernel does a partition check on /dev/nbd0 it will fail with
COUNT=3D1 as well.


For the second case, with sparse_cow=3Dtrue, we need to repeat the test
with an offset > 0.  expwrite() calls write() instead of pwrite().

export OFFSET=3D100
export COUNT=3D3 # anything >=3D 1
dd if=3D/dev/urandom of=3Dtestdata bs=3D4096 count=3D$COUNT # random data
dd if=3Dtestdata of=3D/dev/nbd0 bs=3D4096 seek=3D$OFFSET count=3D$COUNT
dd if=3D/dev/nbd0 of=3Dcompdata bs=3D4096 skip=3D$OFFSET count=3D$COUNT
sum testdata compdata

The first time it's run, it will result in an Input/Output error.

The second time it's run, it will work.


First patch:

diff --git a/nbd-orig/nbd-server.c b/nbd-patched/nbd-server.c
index 92fd141..d1d45b2 100644
--- a/nbd-orig/nbd-server.c
+++ b/nbd-patched/nbd-server.c
@@ -1583,6 +1583,7 @@ int expread(READ_CTX *ctx, CLIENT *client) {
                                goto fail;
                        }
                        confirm_read(client, ctx, rdlen);
+                       ctx->current_offset +=3D rdlen;
                } else { /* the block is not there */
                        if ((client->server->flags & F_WAIT) &&
(client->export =3D=3D NULL)){
                                DEBUG("Page %llu is not here, and
waiting for file\n",


Second patch:

diff --git a/nbd-orig/nbd-server.c b/nbd-patched/nbd-server.c
index 92fd141..9a57ad5 100644
--- a/nbd-orig/nbd-server.c
+++ b/nbd-patched/nbd-server.c
@@ -1669,7 +1669,7 @@ int expwrite(off_t a, char *buf, size_t len,
CLIENT *client, int fua) {
                                if(ret < 0 ) goto fail;
                        }
                        memcpy(pagebuf+offset,buf,wrlen) ;
-                       if (write(client->difffile, pagebuf,
DIFFPAGESIZE) !=3D DIFFPAGESIZE)
+                       if (pwrite(client->difffile, pagebuf,
DIFFPAGESIZE, client->difmap[mapcnt]*DIFFPAGESIZE) !=3D DIFFPAGESIZE)
                                goto fail;
                }
                if (!(client->server->flags & F_COPYONWRITE))


Berend

--9eaffb7cc3902957a7a98ec6e210bdceb0a6e910934e03ad62b2dbbaa959
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - Berend De Schouwer -
 0x128CD671.asc"; name="publickey - Berend De Schouwer - 0x128CD671.asc"
Content-Type: application/pgp-keys; filename="publickey - Berend De Schouwer
 - 0x128CD671.asc"; name="publickey - Berend De Schouwer - 0x128CD671.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuOC4yCgp4c0ZOQkZXS2tVRUJFQURYdWlFWVcx
WUlnTm5yYXpFby8wemVsVHp4YkhDRy93V3huN0FTdWQ4eEhMMWpxWks1CnF4UVMvNldSYm5RdjVj
NURQdmsxT2Y2RS8yWFZzRlVRSmdSMVlGeEd0TnQxUUFsNVIwdmo3cnZyOG5CYmVRaGMKbUhzdndH
cFQ3YWJrZXZXRnZtY0hiTktmWGJjL3NmRHJDTW90UkZRQm9oYzdveW8rTnpPSk9RcEpxQ2J6d2sr
awpWbVZoVkhwdzhZenZuRDJzVkRxYlFPeHRXbXJjb2ZtOURiMjhORTBOY04yUDlBQmJOSnV0MVFV
Wld0WjFsbVc2CnJ5aGdLckM0dXhTei9ZTmNjNXpzMlo3NjFTR0tPU1k4UFZ6dlZrTGJLOWZiZFk3
amNnR0NGZDZHUllPQjJJM0IKN0NPOXVhZnVUb0NEeWhscWx1Z1dYcEdvQTVCN28vYTRaMWI3cWxO
c0VtcWxHaCtlRDk0SDhNL0xXOGR3WU5SSQpvVU5ZSWF5UkYxT1FwcmM1UHozaUN4YW9ub0lpR2Z4
R1pxTktUOVFXb0lnOHJPQzA4dGNyOHVqNG0xUmpKcnN6ClNqdGt3c29tMFV3cEJ5Z0hlLzNCcDR4
WlN4Z2FmTXc2ZEdTS1JzRFRBSGoyRkpGV2N0Tmx1WTRqdnhSWDdDdVcKNTlRMzVKSUU4bStPZ1li
Z0xrR1FmRWRVeWhjUnFCMCtWUjJXUmxYNXNLVVprV2cxQWhnY0w3RmltTmxsM2YwNgp5ZS91emJy
YVVZSFg3eGMzdjVDSjJaNnd4Nk1waFp6aGh4dUJxTGNZSkViTjlmTnNldlRPWWtFUUlzR0M3Tldv
ClQyaHkzdWplWUJQajNjbzJOZDRpV085dHB5c0xaOGdLMTUvZE5qTUJUc3ByUys5UlBxZ3o1QnRG
bXdBUkFRQUIKelN4Q1pYSmxibVFnUkdVZ1UyTm9iM1YzWlhJZ1BHSmxjbVZ1WkVCa1pYTmphRzkx
ZDJWeUxtTnZMbnBoUHNMQgplQVFUQVFJQUlnVUNWWXFSUVFJYkF3WUxDUWdIQXdJR0ZRZ0NDUW9M
QkJZQ0F3RUNIZ0VDRjRBQUNna1EyMjdnCmNaT0FvT25YZGcvOUVGZFJyL1h0T1liQmVsdGIwc05I
YVNQN1M0dmtscWNBdE9udFRZVjN5TUZOdjlYQlhYdkYKU0thR2wwbTVMaGVOQWtJdS9ZYkFkR1h5
U3pOVWQ3V3NmeWIrMjNpcTVVS0d0K3dEK1JvY0xaWTA5NHVBS2NRUQpUWndKS1R3NHRLSWdONHFC
dE9hTmlKd0x1cnNOWllBUDdKSUpGUFFZNTVwYSt5ZWMzanhmVFgwYTdydWllY29zCm16YXZRMTgy
VitMZGV2Mmtvckd2WTFjejQzclA4eGlMMURqdGNCVW5laWdiajUrTjBaOFVsam5SNlFrU1J1YWoK
ZHNHQkFYSG1rT3NCVi9vOE04dkZXYThOODN1czFHa3k1SzU0eFFPYVZ5TlJWclI0RUlTdjh5MGkz
M3J3R1l2UApCRCtSS2FMYWN1S2I4KzhLTlZ1UTVNMHYrNHBHci9GZVhwUCtuUHpWRGZiWlpoWDFp
d2VRMDY5TEthOXJlZjhxCkV3NFZWdDdBdVlGU3dlSFZNSUNBMFpHeUtKNWhaejdMZEkwdkFGQU55
VXQwS29XZWVLNjl4aWs4cnZGNzVlbzQKZnovV0p0Zi9BZG5DdVlwNjBvYm94L3NKQTdLclpyV1FO
YkRjbEplZmlTWlY3dHVIaDdqTEpxUXVma201RDVnbwp3QUFvNWdyTS82V0FOSFZ3NWlvak0vVUc2
ZjArdEZaWGdGTXlrMkpaeTljMnM4VlFnSTJVenJiVThKc0N0ZERqCkJVU1RDNjRSN2tsdlY1Ymt1
MzFBbTNSUEMyOWwxaGZZKzNVTGc0dzhtbXBKMjhwcSsvejBvS0g4Q3d5aWN1RlAKRkJHOTVsbi83
dHRlNGlmV2tmek1MOE9oMmJwdUtFYjJQV1I0NHNRMVpxOCtJQWpTMlh3TDQ1N093VTBFVllxUgpR
UUVRQUtYYUwvaEhueXdzRnlVUVVHNVdxYm9xSHRWODNTNEc5aEpMQ25MOWhnU0J2Z2twbTRjNi85
Mmt6Lzh5CmdvRTRjUjNHSmZsZm40OHRUNFkvWDZzTkZiSXY5VkhpWVo4aW9YVUc0bHBhMFIyN3pk
MVZZT1pXUStvS3RjRnoKb1djVlViOHQrT1BoM2tuME5WQWxFRnlya0k5YWdUc0p1OFJ0alNpMEV6
Wi9iQ0xaTStFMU9UQnpZUzFuelZlcgp1NVVid1FWbXAzbUlzS2JSVTRRbnpZSElWVGNFeDF5SGxC
M1ZkZFd6M0pnenVsWlF4SDdRREVGaTVBaDhjcUVDCjJSZ2w2K2JkdVBqYnJBK2RwV2VaTGtvUGhH
d0xZcVM0YnJxN0ZBbmtMMjFSTGVGQzkvY203dTNaMnozd1o5QXkKZWt2bmtPNnhxdGlqcDB2Y0RD
V3kxbldiV0tpN2Y5K1NQWW5xTTNKVFBqWnlobk9CQ2pWTFhUcnlYQ3BhRGFCYgpnWGZRSlpMOWwx
bTRqVzBoQjNEdlU5eGQ2Zi8zdW1vODMzS1BnMm5XenpnZ0tRODREUUd3L0hYdkFSdDVtR0ZTCmQv
REtkMlliTHc5QjJKSlpqb2kzc2VGWlN6YVZKZ0FWZk9neUk0NHRnN3pJSlVUZDk2VzVpeEE3SEVP
TkV4cG0KQ0JrZ3ArMmswZEg1SU84c1lXd1o0c3lXQk5kZ1cxeGd2Qzc1dm94TmZTZGJmcGRhMG91
YU5xYVR0YjdzcnlVZApsTFZ3bExZZkV4NU9EeFFVY1VyNHRKUDhsR1I4dkEwemhGSEJhTEdCcjBa
SU16UU5TcS9jS3NrNnNESXI0Wms1ClZMT0VVN3R3SFRrZjQ3bXpWTExCQmZ6alJJc2hXRnJvNnBj
NDFBaGk5Y3ArQ3hLYkFCRUJBQUhDd1Y4RUdBRUMKQUFrRkFsV0trVUVDR3d3QUNna1EyMjdnY1pP
QW9PbXkzUkFBdGpNMGtPQjN1OTZ0S0pieGpERnlUTjZhTk9WLwo5WXk2V2doRjJITldvN0hzbk55
dnNRTkF1cHhWMndBTGF0UGVjUFgrL04vdWVGUUtyQTMvd3FVUTkwMkw0VXhWCnJMa1d5a2RZb09P
cGd4TUxkUXB6Z2NRT1RTV1BDdlAwVi9jVnNYY1dKaVZFRGg5VGp1SzBLc1loRm1XR2E2bmUKNHVS
MVY2VkJ5SUtaay9vRGthSVhCanJaU1ZUT1M2ZzZWRi9XaWhHKy9NL0MyZU94eEJZMzdqWm5xREpR
bjNxWApoWTJjVE4wbTlrTFFQdjJqUE9LcjAzUHIvbFdIV1Rpc1EzRkNWbG1ZUTBJSUcyRlpKSmNS
RGNELzhOOGpoMWVhCnpFQmowK1lSMitMUUxzVWN6bDBQSkM0TGV4eERTUVg4MlRlV21nUklXc3Mv
UTM2VUNIOVNyOFl6Sk9BSkxWWEYKNUJMQXgybFlVQWk4bmN0cjhIMmdML0RQOHlOT3hBZ05QSVhy
QjNnQk9XYTF4MmNROHNOeDMvVXVYZFIyNXQyYgo3eGpseFdlWmM5ejJnTzlyZUVKRWt6a21HVjhR
Sk1QSFAvejZRdTZIUVlqUFlyL3I0T1FSSGFpN1RMSkZsTFBNCkJLQTJGVWlZNzFaTUxZWHRXUms1
WG85SnVGL0F0dncwU3JxcFoyRE5PeUtLZmJzMTRNOS84RXkzUUFVTklTSXQKUDQyMlJNQUQxdzha
WGcxWlBqSEo4TGo3Qms3RTJGN0YzVlUwSXFCSVVsc1J5eUJvMUs3SDdRT1pwdmJFeERRSgpnMWx4
YlhhS1lrRFEwREdhb2FnT3pVYVo5ckxCdkpFNHo3QzBTZ3BjWFpaMHJuT3lkdm5GMGhCWG93djdX
YkYrCmk0WlB5REJjM242OHJxcz0KPTlTWGwKLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0st
LS0tLQ==
--9eaffb7cc3902957a7a98ec6e210bdceb0a6e910934e03ad62b2dbbaa959--

--------84c79caabcbe2db15b65db0f5c6707ddef25aa1596c386cb9406a4f6f891f9ca
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsGpBAEBCABdBYJoGOUWCZDbbuBxk4Cg6TUUAAAAAAAcABBzYWx0QG5vdGF0
aW9ucy5vcGVucGdwanMub3JnBWE7rTjB515wlBB+v7XP+xYhBBKM1nGLSON6
q6UFAttu4HGTgKDpAAC56BAAuTmpJiwrBgZmal7e7NvEAxlnkk/Gq64CJu7+
FbWAGTZ69I2F1FBD0QscqgEnUkKJQu6F6fCWFfyXOiO46FM+1TmgX3kUeIk1
Qajd9BnA7X/9Va6vxc0eaJh0HE2SYt2GTeo65Zw9Qm3Y61bF1rmOw6aZpxdZ
iYGioyj8j/C7XwbyXFfIAFy6UFiMz9ciySEWnftNp6wppCOcq8auOvZwsFYb
4BvgmACgLil28BQnL1lqg7BAjhgl//cySekUOIL7fPk5JvgbQJZHJygYvKFJ
nh2NN4YZUo2vS5rVSwalmXhOviN+Ea+LfdwqLZ2bDmlQVzH/BQvxoGtHKhO2
Rv/ik5BrtIERGqm31XQ/v25FK0Rb3RQKgfzjKRT43DDcfTT2JjQr2eHoWIm8
J+BgUnqTXUSHESb/7H//0/UgqNhvL9SWxp7ntUVP18CG7rPbwZ7NDUG8nwb9
yNeETO4uR+7c1mR1JsHvz4cxUC3yGLdjqlMjua0jNXWl8rUN8HoBTUhXBFnu
Hice/qreubnHJC+HTT8CEA0h89qXftxjS3AgS+jxQKT30IfTJw2//Vem0ZBB
UunKEKXVXK3YPHvDDvXKAhsl67DC8cDn9tZguccYZUbc7UniVgiCQLwW2NFq
o6lw34pZAP0FoTzgz3myljBtXBtCqtKntua2hbfvYadp9tU=
=3uer
-----END PGP SIGNATURE-----


--------84c79caabcbe2db15b65db0f5c6707ddef25aa1596c386cb9406a4f6f891f9ca--

