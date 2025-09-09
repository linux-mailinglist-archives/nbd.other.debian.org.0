Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C9BB4FD78
	for <lists+nbd@lfdr.de>; Tue,  9 Sep 2025 15:39:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DF049205BE; Tue,  9 Sep 2025 13:39:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  9 13:39:28 2025
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 11ACF205A0
	for <lists-other-nbd@bendel.debian.org>; Tue,  9 Sep 2025 13:39:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.097 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id te-EV04LZuUz for <lists-other-nbd@bendel.debian.org>;
	Tue,  9 Sep 2025 13:39:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 309 seconds by postgrey-1.36 at bendel; Tue, 09 Sep 2025 13:39:12 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 982C7204D2
	for <nbd@other.debian.org>; Tue,  9 Sep 2025 13:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757425147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BXqa/2VkY+MYk3taj1l57EoqmZshiIHmHuWstQftUs=;
	b=X9NGAEiXYoLoMQ8UItRLIdI1xeKtaaDpIF5J9Ym6cDAVYI6lVrDDwqa7qqPCphcl5bkuwM
	1eelMvQjGNBIv1G4AduqxdR3DZJXFQXixfQA4+GIiF6Iv/nrZpur8KSpsEU4E+df3ABHqZ
	SlDVXi2gtvYaQ9fKq6ESYX0prRw2KJY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-2iugDZeIPuO7Vf7gf0CKVg-1; Tue,
 09 Sep 2025 09:32:42 -0400
X-MC-Unique: 2iugDZeIPuO7Vf7gf0CKVg-1
X-Mimecast-MFC-AGG-ID: 2iugDZeIPuO7Vf7gf0CKVg_1757424760
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E93CA19541BD;
	Tue,  9 Sep 2025 13:32:39 +0000 (UTC)
Received: from localhost (unknown [10.45.226.196])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EA2163000198;
	Tue,  9 Sep 2025 13:32:36 +0000 (UTC)
Date: Tue, 9 Sep 2025 14:32:32 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org,
	Eric Dumazet <eric.dumazet@gmail.com>,
	syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com,
	Mike Christie <mchristi@redhat.com>,
	Yu Kuai <yukuai1@huaweicloud.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH] nbd: restrict sockets to TCP and UDP
Message-ID: <20250909132936.GA1460@redhat.com>
References: <20250909132243.1327024-1-edumazet@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909132243.1327024-1-edumazet@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LA8ajBJofHC.A.FPpC.Q4CwoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3432
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250909132936.GA1460@redhat.com
Resent-Date: Tue,  9 Sep 2025 13:39:28 +0000 (UTC)

On Tue, Sep 09, 2025 at 01:22:43PM +0000, Eric Dumazet wrote:
> Recently, syzbot started to abuse NBD with all kinds of sockets.
> 
> Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
> made sure the socket supported a shutdown() method.
> 
> Explicitely accept TCP and UNIX stream sockets.

I'm not clear what the actual problem is, but I will say that libnbd &
nbdkit (which are another NBD client & server, interoperable with the
kernel) we support and use NBD over vsock[1].  And we could support
NBD over pretty much any stream socket (Infiniband?) [2].

[1] https://libguestfs.org/nbd_aio_connect_vsock.3.html
    https://libguestfs.org/nbdkit-service.1.html#AF_VSOCK
[2] https://libguestfs.org/nbd_connect_socket.3.html

TCP and Unix domain sockets are by far the most widely used, but I
don't think it's fair to exclude other socket types.

Rich.

> Fixes: cf1b2326b734 ("nbd: verify socket is supported during setup")
> Reported-by: syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/netdev/CANn89iJ+76eE3A_8S_zTpSyW5hvPRn6V57458hCZGY5hbH_bFA@mail.gmail.com/T/#m081036e8747cd7e2626c1da5d78c8b9d1e55b154
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Cc: Mike Christie <mchristi@redhat.com>
> Cc: Richard W.M. Jones <rjones@redhat.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Yu Kuai <yukuai1@huaweicloud.com>
> Cc: linux-block@vger.kernel.org
> Cc: nbd@other.debian.org
> ---
>  drivers/block/nbd.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 6463d0e8d0cef71e73e67fecd16de4dec1c75da7..87b0b78249da3325023949585f4daf40486c9692 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1217,6 +1217,14 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
>  	if (!sock)
>  		return NULL;
>  
> +	if (!sk_is_tcp(sock->sk) &&
> +	    !sk_is_stream_unix(sock->sk)) {
> +		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: should be TCP or UNIX.\n");
> +		*err = -EINVAL;
> +		sockfd_put(sock);
> +		return NULL;
> +	}
> +
>  	if (sock->ops->shutdown == sock_no_shutdown) {
>  		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown callout must be supported.\n");
>  		*err = -EINVAL;
> -- 
> 2.51.0.384.g4c02a37b29-goog

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

