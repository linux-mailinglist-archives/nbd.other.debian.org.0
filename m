Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46D6ECA91
	for <lists+nbd@lfdr.de>; Mon, 24 Apr 2023 12:48:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3086E20732; Mon, 24 Apr 2023 10:48:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 24 10:48:12 2023
Old-Return-Path: <colyli@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 23CCA20725
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Apr 2023 10:30:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id f4b8k8TB4Qaa for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Apr 2023 10:30:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 624 seconds by postgrey-1.36 at bendel; Mon, 24 Apr 2023 10:30:37 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E357120724
	for <nbd@other.debian.org>; Mon, 24 Apr 2023 10:30:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 79A7F1FD7D;
	Mon, 24 Apr 2023 10:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682331608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8HvVdeDiIgiuBeUDj17fn5dqrFt5dqGREda0ixO83bE=;
	b=Yy0WJzsZgknyxIkT8ZupXHV2gU8R7J656Huu1VcKZASk4jNNz3aAg7P+5vyYwq3T3kUxNu
	26W06XckOTCE9/mTcWWlPCeF9z1YOo9dB4dyn4LPJQin7G3/7fQs4qLl9rBLah3RoWxAOL
	2SEKUgl8G4pbePizxsUWt4yKYtCjcII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682331608;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8HvVdeDiIgiuBeUDj17fn5dqrFt5dqGREda0ixO83bE=;
	b=XrWNSOJ06s3ar4CN/oq0TfkqoQSJ0De+M0u+cLclK1VYnGBkIMzBDKwjmZ4MumXxxx9O9u
	JIurkNzeN2kqgZAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40B081390E;
	Mon, 24 Apr 2023 10:20:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DckIBNVXRmQ7KwAAMHmgww
	(envelope-from <colyli@suse.de>); Mon, 24 Apr 2023 10:20:05 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 5/5] bcache: don't clear the flag that is not set
From: Coly Li <colyli@suse.de>
In-Reply-To: <20230424073023.38935-6-kch@nvidia.com>
Date: Mon, 24 Apr 2023 18:19:52 +0800
Cc: linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org,
 axboe@kernel.dk,
 josef@toxicpanda.com,
 minchan@kernel.org,
 senozhatsky@chromium.org,
 Kent Overstreet <kent.overstreet@gmail.com>,
 dlemoal@kernel.org,
 johannes.thumshirn@wdc.com,
 bvanassche@acm.org,
 vincent.fu@samsung.com,
 akinobu.mita@gmail.com,
 shinichiro.kawasaki@wdc.com,
 nbd@other.debian.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1D47747-F82A-4395-9B11-8A717BB2D96A@suse.de>
References: <20230424073023.38935-1-kch@nvidia.com>
 <20230424073023.38935-6-kch@nvidia.com>
To: Chaitanya Kulkarni <kch@nvidia.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <laFL755jzGE.A.n6D.s5lRkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2449
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/F1D47747-F82A-4395-9B11-8A717BB2D96A@suse.de
Resent-Date: Mon, 24 Apr 2023 10:48:12 +0000 (UTC)

On Mon, Apr 24, 2023 at 12:30:23AM -0700, Chaitanya Kulkarni wrote:
> QUEUE_FLAG_ADD_RANDOM is not set in bcache_device_init() before we =
clear
> it. There is no point in clearing the flag that is not set.
> Remove blk_queue_flag_clear() for QUEUE_FLAG_ADD_RANDOM.
>=20
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>

Acked-by: Coly Li <colyli@suse.de>

Thanks.

> ---
> drivers/md/bcache/super.c | 1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index ba3909bb6bea..7e9d19fd21dd 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -971,7 +971,6 @@ static int bcache_device_init(struct bcache_device =
*d, unsigned int block_size,
> 	}
>=20
> 	blk_queue_flag_set(QUEUE_FLAG_NONROT, d->disk->queue);
> -	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, d->disk->queue);
>=20
> 	blk_queue_write_cache(q, true, true);
>=20
> --=20
> 2.40.0
>=20

--=20
Coly Li

