Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 928F66C7C56
	for <lists+nbd@lfdr.de>; Fri, 24 Mar 2023 11:16:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 478C7206CE; Fri, 24 Mar 2023 10:16:47 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 24 10:16:47 2023
Old-Return-Path: <mkoutny@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,PGPSIGNATURE,
	RCVD_IN_DNSWL_MED autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0D23220698
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 Mar 2023 10:16:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4qNu0BqF9Xib for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 Mar 2023 10:16:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 897BE2053A
	for <nbd@other.debian.org>; Fri, 24 Mar 2023 10:16:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7AAA21F898;
	Fri, 24 Mar 2023 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679652986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VFdEpZgkMqY3jkdL4KU0Ps6zGuMFPWyX35+yWmsMQgk=;
	b=Xs+hNl/yRKg1wDMgjI39W1rFF/NLiFCJo8I8fqIgEc8No9Ouv0wCHOvK2/sNSPh0mxC5RK
	ZEnUBH90/GS1q3zhm/+pNwUc6EvZeGGbCHyfbNbMvMUFQwBx+eDiSWZAjJIYT0cd34E0IJ
	etx9CuLqw3wAHnb/xgzkkfjPodns7h8=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D926138ED;
	Fri, 24 Mar 2023 10:16:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KV5VDXp4HWT1OgAAMHmgww
	(envelope-from <mkoutny@suse.com>); Fri, 24 Mar 2023 10:16:26 +0000
Date: Fri, 24 Mar 2023 11:16:24 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	Navid Emamdoost <navid.emamdoost@gmail.com>,
	Michal Kubecek <mkubecek@suse.cz>
Subject: Re: [PATCH RESEND v3] nbd_genl_status: null check for nla_nest_start
Message-ID: <20230324101624.mnbagb3jxshucawq@blackpad>
References: <20230323193032.28483-1-mkoutny@suse.com>
 <6c507b78-35fb-fe23-51f0-e5bb754679d0@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tly6jqa3p5uzjb5y"
Content-Disposition: inline
In-Reply-To: <6c507b78-35fb-fe23-51f0-e5bb754679d0@kernel.dk>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uf3WPzKwtRE.A.xFC.PiXHkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2409
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230324101624.mnbagb3jxshucawq@blackpad
Resent-Date: Fri, 24 Mar 2023 10:16:47 +0000 (UTC)


--tly6jqa3p5uzjb5y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for the reply.

On Thu, Mar 23, 2023 at 04:51:17PM -0600, Jens Axboe <axboe@kernel.dk> wrot=
e:
> So please don't mix CVEs into any of this, they don't matter one bit.

Do not shoot the messenger.

(But I'll refrain from that numeric reference to disincentivize such
trophy collecting.)

> Never have, and never will. What's important is how the bug can be
> triggered.

=46rom my perspective it's pragmatic better-safe-than-sorry -- a proof may
be conceived that rules out any triggering condition, it's less work to
put the guard in though.

My .02=E2=82=AC,
Michal

--tly6jqa3p5uzjb5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTrXXag4J0QvXXBmkMkDQmsBEOquQUCZB14dgAKCRAkDQmsBEOq
uQ71AQDGZxjMPEueZul0m/zsn0FkW1akNCWxkd5shBj5jiI4vAD/Ua8Gutx5iw+Y
Sprxj5N+CO+W9Cw4P19YOI66IpM+wAQ=
=4Dp8
-----END PGP SIGNATURE-----

--tly6jqa3p5uzjb5y--

