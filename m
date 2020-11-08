Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFFC2AAC0F
	for <lists+nbd@lfdr.de>; Sun,  8 Nov 2020 17:03:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5F19F20227; Sun,  8 Nov 2020 16:03:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Nov  8 16:03:08 2020
Old-Return-Path: <pbonzini@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 67B7820211
	for <lists-other-nbd@bendel.debian.org>; Sun,  8 Nov 2020 15:47:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.798 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
	RCVD_IN_MSPIKE_WL=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id p4TuLzc58alW for <lists-other-nbd@bendel.debian.org>;
	Sun,  8 Nov 2020 15:47:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id B67DC201C0
	for <nbd@other.debian.org>; Sun,  8 Nov 2020 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604850429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCiEM7AQz5QZ2RvY5C0nr85g19BsqN3bEHGGJWjun8g=;
	b=ZAMlXRQkH4fSKMW5jUW8kKKK6ocT7SNlcEdR1I/82Xsp0HWz3uHLEEcd34e7T/pY2MfIjp
	2snnIDrYH3RFVJQlYQr4Pcfimt6hKxi3Qf0nhsipeAwfb4rFqO3KNU5J1Gmtz6UiToH3oF
	voEWo0lo1ZoCoC55IhEuMFJLSiqI0jA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-VbfY52jhMiajjxPKEwXRkQ-1; Sun, 08 Nov 2020 10:15:09 -0500
X-MC-Unique: VbfY52jhMiajjxPKEwXRkQ-1
Received: by mail-wr1-f72.google.com with SMTP id y2so431612wrl.3
        for <nbd@other.debian.org>; Sun, 08 Nov 2020 07:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xCiEM7AQz5QZ2RvY5C0nr85g19BsqN3bEHGGJWjun8g=;
        b=n9CCAUujloxQiLAV4NkibiwFjx6GNgBFDK3q58rbtvDObETeBQqbMSRzfZr5ZPiSqM
         8rvOKwQvHAcGTUDTnHo1xUcxJiPwgNYiqORm27b01e/b/2Lm15J5qP/2sUXRg/rKFgL0
         GakwA67f/Slq9hUosfJddb1cx3jaebBfXM2yxfVtTlLfMf7unIx9br1joSqoa4btOSIn
         aJEtNYwOlm59AYDOp4ZhVcQBRluUlvPlP8Ie4oy48n3CMQKStUH9Q8koecFC5fL7OyR6
         0QCaev25i8oJcmIrH2C3PszDzv/d7NdG/J1hB9lknyx6VM2aIHJTQ0sE4yjgImo5NEhI
         ODHw==
X-Gm-Message-State: AOAM533eJHR3CBAMXmjHpCX7mK7R0yoYD1gdJIX9K+v74Gl+xU1AY907
	G3qAGfo1Xxv4mznX1f5UyslZhT2Y5xTd8kPFejfeNIZQPgHQH+f8f05zNBsdj4nRaawJ1rIXhcm
	tlhXCyAcgjcp0dw==
X-Received: by 2002:a1c:80d3:: with SMTP id b202mr10142610wmd.139.1604848507853;
        Sun, 08 Nov 2020 07:15:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBz6wtcRAgwxrEGiAL8ElHcOzDdD7qQjz/7QuIFGOGrDkKJazoMrCqH8844xWODBZg8NNGyg==
X-Received: by 2002:a1c:80d3:: with SMTP id b202mr10142589wmd.139.1604848507695;
        Sun, 08 Nov 2020 07:15:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id l3sm11508325wmg.32.2020.11.08.07.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 07:15:06 -0800 (PST)
Subject: Re: [PATCH 23/24] virtio-blk: remove a spurious call to
 revalidate_disk_size
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20201106190337.1973127-1-hch@lst.de>
 <20201106190337.1973127-24-hch@lst.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d23bd50a-7555-438b-9e3b-131414b2d1a5@redhat.com>
Date: Sun, 8 Nov 2020 16:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106190337.1973127-24-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jMixmGWaaJ.A.dhH.8aBqfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1041
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d23bd50a-7555-438b-9e3b-131414b2d1a5@redhat.com
Resent-Date: Sun,  8 Nov 2020 16:03:08 +0000 (UTC)

On 06/11/20 20:03, Christoph Hellwig wrote:
> revalidate_disk_size just updates the block device size from the disk 
> size. Thus calling it from revalidate_disk_size doesn't actually do 

s/revalidate_disk_size/virtblk_update_cache_mode/

> anything.

