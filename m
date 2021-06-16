Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A39843A9BC5
	for <lists+nbd@lfdr.de>; Wed, 16 Jun 2021 15:15:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 13EBA203A2; Wed, 16 Jun 2021 13:15:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 16 13:15:12 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 896062033D
	for <lists-other-nbd@bendel.debian.org>; Wed, 16 Jun 2021 12:59:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Br4ZLk1P2zpt for <lists-other-nbd@bendel.debian.org>;
	Wed, 16 Jun 2021 12:59:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-ot1-x332.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EA96A2025D
	for <nbd@other.debian.org>; Wed, 16 Jun 2021 12:59:39 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso2332994oto.12
        for <nbd@other.debian.org>; Wed, 16 Jun 2021 05:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2jLSVmuLw4Nb055fI6F5c4n6Y22HkMR7OQfqkvuCNLI=;
        b=fUjGVI1wI44GueP/8qBEGqyVV7NLUmOaIAeyp6CWQXjf7vZ7tnDvIJgVm6qIzUZk3t
         8JWqWR2V4MG5tM4WpAU1MejqCWif82xUXXy/0FMAcKRMCHYnTZNLbIaLrqv5kOQIOkjp
         sApMoUC+CA2QoEQfSDKsfQF1oai8iMC663Uo9AYqcUx5pGrRG3YsfWa+ERQrJLvTG1tq
         xLV2Lohb2GjBvNa5VIzi2beGU3UuVLkRnSSTN5wdWeWTkgS7dmp0z+DuKbDoTX7UGksI
         aW7tvP8LiEZIgEwq7PEGyHJRy82VqVLeQL2h/X4HrhjIha4cZxaMLq+NOfIJFaqey22V
         SwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2jLSVmuLw4Nb055fI6F5c4n6Y22HkMR7OQfqkvuCNLI=;
        b=Ikt5C0ccUZXuYLeg9A4oFO8gkhlnVCSmr4bAr1frokk80Z1mmcrnsMsILuANOUeWgh
         GbQs+5YN/uJVgURF7qQpppe0QZaX9Eo3AqZq436FQnvYopVaUt5hUXv5xHgsAhatBIx/
         5dwfu689tSSBMFek03T9hiuGW7REsAn6/YPR0XVgV1NjYr8TEpGpwiFFn03d2PzLtfck
         xDoymq8pkZ9T/C8Nv7NcQsElTAHohwJlCttU/kovHha12IO2GLGu5qgaJGTmZ37fjzcy
         MFl6sxbCzpYJ+XUqvGFormsTHQ6tG1t6iHowGi4wQN3dwtPMMcncvDijdpGx705LrhSa
         cuyw==
X-Gm-Message-State: AOAM5330RpfH9yxBwDcBEKqaANi6ZyYFBURbNMQIzy/gXPupWQGeO00m
	QqpGAXYRAICL94FUsVmT8HAe4A==
X-Google-Smtp-Source: ABdhPJzozClctq3P3F+vS6zEvZVzcUDa+vFBQHDKbeDCU+xqxPVCz54/ZsosyzWg+6MY9eTPiiqwrA==
X-Received: by 2002:a9d:4d8d:: with SMTP id u13mr3755526otk.367.1623848375674;
        Wed, 16 Jun 2021 05:59:35 -0700 (PDT)
Received: from [192.168.1.134] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id 26sm460938ooy.46.2021.06.16.05.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 05:59:35 -0700 (PDT)
Subject: Re: [PATCH] nbd: provide a way for userspace processes to identify
 device backends
To: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, josef@toxicpanda.com,
 idryomov@redhat.com, xiubli@redhat.com
References: <20210429102828.31248-1-prasanna.kalever@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <f3035a3f-4494-929f-5c21-ba921a77ea6c@kernel.dk>
Date: Wed, 16 Jun 2021 06:59:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210429102828.31248-1-prasanna.kalever@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <I4vl09Uo6DB.A.AMF.glfygB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1216
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f3035a3f-4494-929f-5c21-ba921a77ea6c@kernel.dk
Resent-Date: Wed, 16 Jun 2021 13:15:13 +0000 (UTC)

On 4/29/21 4:28 AM, Prasanna Kumar Kalever wrote:
> Problem:
> On reconfigure of device, there is no way to defend if the backend
> storage is matching with the initial backend storage.
> 
> Say, if an initial connect request for backend "pool1/image1" got
> mapped to /dev/nbd0 and the userspace process is terminated. A next
> reconfigure request within NBD_ATTR_DEAD_CONN_TIMEOUT is allowed to
> use /dev/nbd0 for a different backend "pool1/image2"
> 
> For example, an operation like below could be dangerous:
> 
> $ sudo rbd-nbd map --try-netlink rbd-pool/ext4-image
> /dev/nbd0
> $ sudo blkid /dev/nbd0
> /dev/nbd0: UUID="bfc444b4-64b1-418f-8b36-6e0d170cfc04" TYPE="ext4"
> $ sudo pkill -9 rbd-nbd
> $ sudo rbd-nbd attach --try-netlink --device /dev/nbd0 rbd-pool/xfs-image
> /dev/nbd0
> $ sudo blkid /dev/nbd0
> /dev/nbd0: UUID="d29bf343-6570-4069-a9ea-2fa156ced908" TYPE="xfs"
> 
> Solution:
> Provide a way for userspace processes to keep some metadata to identify
> between the device and the backend, so that when a reconfigure request is
> made, we can compare and avoid such dangerous operations.
> 
> With this solution, as part of the initial connect request, backend
> path can be stored in the sysfs per device config, so that on a reconfigure
> request it's easy to check if the backend path matches with the initial
> connect backend path.
> 
> Please note, ioctl interface to nbd will not have these changes, as there
> won't be any reconfigure.

Applied, thanks.

-- 
Jens Axboe

