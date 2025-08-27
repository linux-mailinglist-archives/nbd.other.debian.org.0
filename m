Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C1B3803B
	for <lists+nbd@lfdr.de>; Wed, 27 Aug 2025 12:48:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5E2A9208F9; Wed, 27 Aug 2025 10:48:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 27 10:48:11 2025
Old-Return-Path: <dwagner@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 72DBB208F6
	for <lists-other-nbd@bendel.debian.org>; Wed, 27 Aug 2025 10:31:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.09 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bqvn9IblQqS1 for <lists-other-nbd@bendel.debian.org>;
	Wed, 27 Aug 2025 10:30:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 666 seconds by postgrey-1.36 at bendel; Wed, 27 Aug 2025 10:30:58 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1742B208F1
	for <nbd@other.debian.org>; Wed, 27 Aug 2025 10:30:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1304D22221;
	Wed, 27 Aug 2025 10:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756289427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NxE5rKnj5TjaBsXbpbII/rsOANqwX+dNrTnexSalI0E=;
	b=Sx5RwQl4mdrvGKXWphXUQ0hvtykvK3pbomkWvnnY3C/J3xN+x2ZHAOSBJLxC4GLt4+IHP6
	fhIb397Tjh7ZItBttJVZrcn5W6MbblkxSPnUuMkh2m4qZnlZylUmCvuzsNJNQDI/fgYDPT
	CxFKOH1aH8JG61b+9eFz6FNE5WZULgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756289427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NxE5rKnj5TjaBsXbpbII/rsOANqwX+dNrTnexSalI0E=;
	b=IydAXml5RA8wO5fCwvDAMvtOzsuRqzJS78ZPyZQjET5bKCdXt3mdY6VsEVH2Z8wcR9Zny6
	ul1gwma8lALLX1Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756289427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NxE5rKnj5TjaBsXbpbII/rsOANqwX+dNrTnexSalI0E=;
	b=Sx5RwQl4mdrvGKXWphXUQ0hvtykvK3pbomkWvnnY3C/J3xN+x2ZHAOSBJLxC4GLt4+IHP6
	fhIb397Tjh7ZItBttJVZrcn5W6MbblkxSPnUuMkh2m4qZnlZylUmCvuzsNJNQDI/fgYDPT
	CxFKOH1aH8JG61b+9eFz6FNE5WZULgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756289427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NxE5rKnj5TjaBsXbpbII/rsOANqwX+dNrTnexSalI0E=;
	b=IydAXml5RA8wO5fCwvDAMvtOzsuRqzJS78ZPyZQjET5bKCdXt3mdY6VsEVH2Z8wcR9Zny6
	ul1gwma8lALLX1Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 038D713310;
	Wed, 27 Aug 2025 10:10:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z+iAO5LZrmg1JQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 27 Aug 2025 10:10:26 +0000
Date: Wed, 27 Aug 2025 12:10:26 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v6.17-rc1 kernel
Message-ID: <ff748a3f-9f07-4933-b4b3-b4f58aacac5b@flourine.local>
References: <suhzith2uj75uiprq4m3cglvr7qwm3d7gi4tmjeohlxl6fcmv3@zu6zym6nmvun>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <suhzith2uj75uiprq4m3cglvr7qwm3d7gi4tmjeohlxl6fcmv3@zu6zym6nmvun>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Wl9y0RBsyfF.A.LjLB.rJuroB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3422
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ff748a3f-9f07-4933-b4b3-b4f58aacac5b@flourine.local
Resent-Date: Wed, 27 Aug 2025 10:48:11 +0000 (UTC)

On Wed, Aug 13, 2025 at 10:50:34AM +0000, Shinichiro Kawasaki wrote:
> #4: nvme/061 (fc transport)
> 
>     The test case nvme/061 sometimes fails for fc transport due to a WARN and
>     refcount message "refcount_t: underflow; use-after-free." Refer to the
>     report for the v6.15 kernel [5].
> 
>     [5]
>     https://lore.kernel.org/linux-block/2xsfqvnntjx5iiir7wghhebmnugmpfluv6ef22mghojgk6gilr@mvjscqxroqqk/

This one might be fixed with

https://lore.kernel.org/linux-nvme/20250821-fix-nvmet-fc-v1-1-3349da4f416e@kernel.org/

