Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A0401688
	for <lists+nbd@lfdr.de>; Mon,  6 Sep 2021 08:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EC550212F6; Mon,  6 Sep 2021 06:45:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep  6 06:45:09 2021
Old-Return-Path: <hare@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,TO_TOO_MANY,TO_WAY_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A1B3F212EA
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Sep 2021 06:27:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.315 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_MED=-2.3,
	TO_TOO_MANY=1, TO_WAY_TOO_MANY=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id E2XWLASqA9Az for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Sep 2021 06:27:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C03C5212E2
	for <nbd@other.debian.org>; Mon,  6 Sep 2021 06:27:16 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3732F20080;
	Mon,  6 Sep 2021 06:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1630909044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reoGgBfdrxX+WdroZ7tTTbt30fzquMqmAzJ6Y/2VXxU=;
	b=equ7tgV6wynOZ3VAyoZBCGm2dpSJZL1LBJpEo0/cVL0LWiYVEsS58MeXnmH/o3o8mwB9bE
	Ohoi10Vfzkm7netncFCPeFZnmQW8lxcJ2ZKAXCBcKV24Og9bgWJBxYtFrXnaUgasQDCaAX
	EB5HP5uV8lZ45KFd/hgdqVOueLsFkNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1630909044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reoGgBfdrxX+WdroZ7tTTbt30fzquMqmAzJ6Y/2VXxU=;
	b=dtOJkJ75fx0ERSDI63nGCpqsK/1H2Libc+7N05NXdqxWVjbkLXIDSojSDAApItO8MMgOn/
	+3faCkSAUlvoS4CQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4D21A13299;
	Mon,  6 Sep 2021 06:17:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id 4SLJD3GyNWFnTwAAGKfGzw
	(envelope-from <hare@suse.de>); Mon, 06 Sep 2021 06:17:21 +0000
Subject: Re: [PATCH v3 5/8] md: add error handling support for add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>, axboe@kernel.dk,
 martin.petersen@oracle.com, jejb@linux.ibm.com, kbusch@kernel.org,
 sagi@grimberg.me, adrian.hunter@intel.com, beanhuo@micron.com,
 ulf.hansson@linaro.org, avri.altman@wdc.com, swboyd@chromium.org,
 agk@redhat.com, snitzer@redhat.com, josef@toxicpanda.com
Cc: hch@infradead.org, bvanassche@acm.org, ming.lei@redhat.com,
 linux-scsi@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mmc@vger.kernel.org, dm-devel@redhat.com, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
References: <20210830212538.148729-1-mcgrof@kernel.org>
 <20210830212538.148729-6-mcgrof@kernel.org>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <e7286b5b-a7f3-05f7-fcb8-1aed78b519da@suse.de>
Date: Mon, 6 Sep 2021 08:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210830212538.148729-6-mcgrof@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2ED73RjrI0N.A.a-.1jbNhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1386
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e7286b5b-a7f3-05f7-fcb8-1aed78b519da@suse.de
Resent-Date: Mon,  6 Sep 2021 06:45:09 +0000 (UTC)

On 8/30/21 11:25 PM, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
> 
> We just do the unwinding of what was not done before, and are
> sure to unlock prior to bailing.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>   drivers/md/md.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

