Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id ED69C824F30
	for <lists+nbd@lfdr.de>; Fri,  5 Jan 2024 08:30:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F3B6220DE4; Fri,  5 Jan 2024 07:30:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan  5 07:30:12 2024
Old-Return-Path: <colyli@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 75FF020D4E
	for <lists-other-nbd@bendel.debian.org>; Fri,  5 Jan 2024 07:12:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.109 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qmf_GKcAJvhA for <lists-other-nbd@bendel.debian.org>;
	Fri,  5 Jan 2024 07:12:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 498 seconds by postgrey-1.36 at bendel; Fri, 05 Jan 2024 07:12:31 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E4B3120D4D
	for <nbd@other.debian.org>; Fri,  5 Jan 2024 07:12:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C30221D33;
	Fri,  5 Jan 2024 07:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704438223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Joh97BwP4hkODKw1vNhuky4flqFq1F3bJri6+hBTkDs=;
	b=a+MMZRcaVUJFcyQjQeZTi2fJEvZrDIhu/NbIcezE7TLkHcKRo55Rn4I1Vf4Ms0kebw0cyf
	NcUU4UykUDcWv75GWyeifhvC1PTSnAXLjelnb88afXk8O4qhDu4cP71jQ/6LxNBSzfMMH0
	UbLhyc8E5YqKzEka3o6F0a9iP04/brs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704438223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Joh97BwP4hkODKw1vNhuky4flqFq1F3bJri6+hBTkDs=;
	b=3mD1IUizJRiMr/ngWXhCDkc2dHbfceAWk49XHWOEHmTTYsC+PBoWb5uViUiAE553s9Glwy
	5SkJv8ZWi3K/tBDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704438223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Joh97BwP4hkODKw1vNhuky4flqFq1F3bJri6+hBTkDs=;
	b=a+MMZRcaVUJFcyQjQeZTi2fJEvZrDIhu/NbIcezE7TLkHcKRo55Rn4I1Vf4Ms0kebw0cyf
	NcUU4UykUDcWv75GWyeifhvC1PTSnAXLjelnb88afXk8O4qhDu4cP71jQ/6LxNBSzfMMH0
	UbLhyc8E5YqKzEka3o6F0a9iP04/brs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704438223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Joh97BwP4hkODKw1vNhuky4flqFq1F3bJri6+hBTkDs=;
	b=3mD1IUizJRiMr/ngWXhCDkc2dHbfceAWk49XHWOEHmTTYsC+PBoWb5uViUiAE553s9Glwy
	5SkJv8ZWi3K/tBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F149F137E8;
	Fri,  5 Jan 2024 07:03:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qn8uKMmpl2VlKAAAD6G6ig
	(envelope-from <colyli@suse.de>); Fri, 05 Jan 2024 07:03:37 +0000
Date: Fri, 5 Jan 2024 15:03:34 +0800
From: Coly Li <colyli@suse.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Josef Bacik <josef@toxicpanda.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 8/9] bcache: use the default discard granularity
Message-ID: <bgbp5rqbxbghiitjvpkuforocw5ptyuubfwwrwdhqy4orkpggo@fu57au3f2hss>
References: <20231228075545.362768-1-hch@lst.de>
 <20231228075545.362768-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231228075545.362768-9-hch@lst.de>
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=a+MMZRca;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3mD1IUiz
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.01 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[14.79%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:email,lst.de:email];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Queue-Id: 1C30221D33
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BPAMxEPVYcK.A.F3B.EA7llB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2706
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/bgbp5rqbxbghiitjvpkuforocw5ptyuubfwwrwdhqy4orkpggo@fu57au3f2hss
Resent-Date: Fri,  5 Jan 2024 07:30:12 +0000 (UTC)

On Thu, Dec 28, 2023 at 07:55:44AM +0000, Christoph Hellwig wrote:
> The discard granularity now defaults to a single sector, so don't set
> that value explicitly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Coly Li <colyli@suse.de>

Thanks.

> ---
>  drivers/md/bcache/super.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index ecc1447f202a42..39ec95b8613f1f 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -954,7 +954,6 @@ static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
>  	q->limits.max_segment_size	= UINT_MAX;
>  	q->limits.max_segments		= BIO_MAX_VECS;
>  	blk_queue_max_discard_sectors(q, UINT_MAX);
> -	q->limits.discard_granularity	= block_size;
>  	q->limits.io_min		= block_size;
>  	q->limits.logical_block_size	= block_size;
>  	q->limits.physical_block_size	= block_size;
> -- 
> 2.39.2
> 
> 

-- 
Coly Li

