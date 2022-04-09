Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8724FA919
	for <lists+nbd@lfdr.de>; Sat,  9 Apr 2022 16:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E962D203AF; Sat,  9 Apr 2022 14:51:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Apr  9 14:51:09 2022
Old-Return-Path: <colyli@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,GMAIL,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AE10F20428
	for <lists-other-nbd@bendel.debian.org>; Sat,  9 Apr 2022 14:33:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.491 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GMAIL=1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YDJhAj4nr6IA for <lists-other-nbd@bendel.debian.org>;
	Sat,  9 Apr 2022 14:33:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D67A520473
	for <nbd@other.debian.org>; Sat,  9 Apr 2022 14:33:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 207A11F864;
	Sat,  9 Apr 2022 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1649514786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BmOfl4NqddautzOtQrZ0dLuhiQSp1fB0SDxF8v7gYBA=;
	b=SJlQufjnXjTQtqgkhM6MsOUPDPwOMZ6xGLQ76UNS6RR1cEGIg2CW/GZ7A0Nq9xE2LKzjCQ
	zm4gbJFRwGS5ZR58/OOlzltxzH57NlfDQ1MS9kgXiNk7elM8N3NSClk0AEwvrheO6NCJzw
	l51uuNG8cURr+Q1l6/il4XbIWcEO2Fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1649514786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BmOfl4NqddautzOtQrZ0dLuhiQSp1fB0SDxF8v7gYBA=;
	b=yiH+qx8I6hbeCP31rtrhbZE5qxMo8OqYiXG+UWOpJ9wghAOQqadl62X34RS7V0fnDyonaX
	HzX10h1d2uotqQBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F41913AA1;
	Sat,  9 Apr 2022 14:32:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id m2GpARiZUWLHIgAAMHmgww
	(envelope-from <colyli@suse.de>); Sat, 09 Apr 2022 14:32:56 +0000
Message-ID: <f01ac878-9b0d-972b-70dc-6f3f61b9947b@suse.de>
Date: Sat, 9 Apr 2022 22:32:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 26/27] block: decouple REQ_OP_SECURE_ERASE from
 REQ_OP_DISCARD
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Jens Axboe <axboe@kernel.dk>, linux-bcache@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, David Sterba <dsterba@suse.com>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-27-hch@lst.de>
From: Coly Li <colyli@suse.de>
In-Reply-To: <20220409045043.23593-27-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OVDxxNTlAsC.A.siB.d1ZUiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1963
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f01ac878-9b0d-972b-70dc-6f3f61b9947b@suse.de
Resent-Date: Sat,  9 Apr 2022 14:51:09 +0000 (UTC)

On 4/9/22 12:50 PM, Christoph Hellwig wrote:
> Secure erase is a very different operation from discard in that it is
> a data integrity operation vs hint.  Fully split the limits and helper
> infrastructure to make the separation more clear.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> [drbd]
> Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com> [nifs2]
> Acked-by: Coly Li <colyli@suse.de> [drbd]

Hi Christoph,

My ACK is for bcache, not drbd here.

Thanks.


Coly Li



> Acked-by: David Sterba <dsterba@suse.com> [btrfs]





