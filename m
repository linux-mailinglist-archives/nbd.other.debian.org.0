Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BCECDA0B02E
	for <lists+nbd@lfdr.de>; Mon, 13 Jan 2025 08:42:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A2F9B206C8; Mon, 13 Jan 2025 07:42:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan 13 07:42:20 2025
Old-Return-Path: <hare@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 544BC206AE
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Jan 2025 07:25:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.398 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fDvulugKN-68 for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Jan 2025 07:25:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6EF39206AD
	for <nbd@other.debian.org>; Mon, 13 Jan 2025 07:25:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 22FDA1F394;
	Mon, 13 Jan 2025 07:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736753125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPMujG4Ms43NVefw5djXYekatCdjL2IaFIVDnYRZmRs=;
	b=0OxxtmGaRhWQhiCpd0QH/9+pI++QHE1qHpsRRWEJIcUs/8LtMYhqzmhQuspFrGQu8eMpP4
	m72dnmh8Vf8HxEWwjNDyhNfXbm/JzRUuNZLLEri8Ia95zNHUPzSzWPmZrm+lOcGbf7IMI/
	vh0vWRDbulMhrIvspaBLrYXV2rCB51o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736753125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPMujG4Ms43NVefw5djXYekatCdjL2IaFIVDnYRZmRs=;
	b=tjuL/suIYABpIe5i4xj/+fZwjIP1XB6ttvrPshUrsB6Necyycue8yUJsz4TH9my9Hr7RNp
	qObWZpZCID4RqdCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736753125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPMujG4Ms43NVefw5djXYekatCdjL2IaFIVDnYRZmRs=;
	b=0OxxtmGaRhWQhiCpd0QH/9+pI++QHE1qHpsRRWEJIcUs/8LtMYhqzmhQuspFrGQu8eMpP4
	m72dnmh8Vf8HxEWwjNDyhNfXbm/JzRUuNZLLEri8Ia95zNHUPzSzWPmZrm+lOcGbf7IMI/
	vh0vWRDbulMhrIvspaBLrYXV2rCB51o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736753125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPMujG4Ms43NVefw5djXYekatCdjL2IaFIVDnYRZmRs=;
	b=tjuL/suIYABpIe5i4xj/+fZwjIP1XB6ttvrPshUrsB6Necyycue8yUJsz4TH9my9Hr7RNp
	qObWZpZCID4RqdCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD7AC13310;
	Mon, 13 Jan 2025 07:25:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IfMmLOS/hGdXLgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 13 Jan 2025 07:25:24 +0000
Message-ID: <f3983911-74d6-4602-af60-17ba37d4c66c@suse.de>
Date: Mon, 13 Jan 2025 08:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] block: fix queue freeze vs limits lock order in
 sysfs store methods
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
 Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, nbd@other.debian.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <20250108092520.1325324-1-hch@lst.de>
 <20250108092520.1325324-6-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250108092520.1325324-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OzHaAVO6aAB.A.oDPC.cPMhnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3351
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f3983911-74d6-4602-af60-17ba37d4c66c@suse.de
Resent-Date: Mon, 13 Jan 2025 07:42:20 +0000 (UTC)

On 1/8/25 10:25, Christoph Hellwig wrote:
> queue_attr_store() always freezes a device queue before calling the
> attribute store operation. For attributes that control queue limits, the
> store operation will also lock the queue limits with a call to
> queue_limits_start_update(). However, some drivers (e.g. SCSI sd) may
> need to issue commands to a device to obtain limit values from the
> hardware with the queue limits locked. This creates a potential ABBA
> deadlock situation if a user attempts to modify a limit (thus freezing
> the device queue) while the device driver starts a revalidation of the
> device queue limits.
> 
> Avoid such deadlock by not freezing the queue before calling the
> ->store_limit() method in struct queue_sysfs_entry and instead use the
> queue_limits_commit_update_frozen helper to freeze the queue after taking
> the limits lock.
> 
> (commit log adapted from a similar patch from  Damien Le Moal)
> 
> Fixes: ff956a3be95b ("block: use queue_limits_commit_update in queue_discard_max_store")
> Fixes: 0327ca9d53bf ("block: use queue_limits_commit_update in queue_max_sectors_store")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
> ---
>   block/blk-sysfs.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

