Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AAB551486
	for <lists+nbd@lfdr.de>; Mon, 20 Jun 2022 11:39:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B686020389; Mon, 20 Jun 2022 09:39:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 20 09:39:21 2022
Old-Return-Path: <hare@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,TO_TOO_MANY,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 09E182042C
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Jun 2022 09:23:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.618 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.228, RCVD_IN_DNSWL_MED=-2.3,
	TO_TOO_MANY=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ctWreVawQlm5 for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Jun 2022 09:23:00 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 73B032043A
	for <nbd@other.debian.org>; Mon, 20 Jun 2022 09:23:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 886301FA93;
	Mon, 20 Jun 2022 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1655716556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MwQ4wbJ2J3BpsHA9sanoJTXO4MMQzFNGd9/de0EGoBY=;
	b=0evdLip207AMccHMFhzVsCpz9WWDB8kZBWhy46M1Os/TZq8J86x5R1wXT0FMZM5wk1rAKv
	2hliiqFK/qcQVwYmwSCmlIajWgZKhDzTA6fKL8lgt9C8D8nGJqthRywxi7sAyRrSyde036
	OUUL7i7k98RUdKjS3owRzEbPwyc4AMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1655716556;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MwQ4wbJ2J3BpsHA9sanoJTXO4MMQzFNGd9/de0EGoBY=;
	b=cQYqw4WBBdTSCSXGh9NrtwH3roY9H/MFeqRDYT+tT+h2/mPXHCiXbuc1VvoURkrcB4IcV4
	ZmMmzxRfzzuriWBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63B26134CA;
	Mon, 20 Jun 2022 09:15:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id VWQgGMw6sGJLPgAAMHmgww
	(envelope-from <hare@suse.de>); Mon, 20 Jun 2022 09:15:56 +0000
Message-ID: <3a5bed1b-4daf-6f9c-6746-b0592a84d05d@suse.de>
Date: Mon, 20 Jun 2022 11:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/5] scsi: fnic: Drop reserved request handling
Content-Language: en-US
To: John Garry <john.garry@huawei.com>, axboe@kernel.dk,
 damien.lemoal@opensource.wdc.com, bvanassche@acm.org, hch@lst.de,
 jejb@linux.ibm.com, martin.petersen@oracle.com, satishkh@cisco.com,
 sebaddel@cisco.com, kartilak@cisco.com
Cc: linux-rdma@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org
References: <1655463320-241202-1-git-send-email-john.garry@huawei.com>
 <1655463320-241202-5-git-send-email-john.garry@huawei.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <1655463320-241202-5-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Rn4hniFB7YJ.A.f3F.JBEsiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2166
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3a5bed1b-4daf-6f9c-6746-b0592a84d05d@suse.de
Resent-Date: Mon, 20 Jun 2022 09:39:21 +0000 (UTC)

On 6/17/22 12:55, John Garry wrote:
> The SCSI core code does not support reserved requests, so drop the
> handling in fnic_pending_aborts_iter().
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>   drivers/scsi/fnic/fnic_scsi.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/scsi/fnic/fnic_scsi.c b/drivers/scsi/fnic/fnic_scsi.c
> index 3d64877bda8d..e7b7f6d73429 100644
> --- a/drivers/scsi/fnic/fnic_scsi.c
> +++ b/drivers/scsi/fnic/fnic_scsi.c
> @@ -2019,8 +2019,6 @@ static bool fnic_pending_aborts_iter(struct scsi_cmnd *sc,
>   
>   	if (sc == iter_data->lr_sc || sc->device != lun_dev)
>   		return true;
> -	if (reserved)
> -		return true;
>   
>   	io_lock = fnic_io_lock_tag(fnic, abt_tag);
>   	spin_lock_irqsave(io_lock, flags);

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer

