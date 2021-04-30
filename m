Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3497B36F420
	for <lists+nbd@lfdr.de>; Fri, 30 Apr 2021 04:47:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DB5692052A; Fri, 30 Apr 2021 02:47:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr 30 02:47:19 2021
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F3704204C7
	for <lists-other-nbd@bendel.debian.org>; Fri, 30 Apr 2021 02:47:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.78 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id EVYM2J4Ivwvd for <lists-other-nbd@bendel.debian.org>;
	Fri, 30 Apr 2021 02:47:07 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 18C10204CE
	for <nbd@other.debian.org>; Fri, 30 Apr 2021 02:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619750821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NUTIYOFEPxTqf3W1ZjVpAvouBr+rrqIQNqoBXwi/aIU=;
	b=Yk4onGsFOhzJl2H1UIfuK8FUhrn7vQWDgRF63jxa9hbOHY385kzmHGpn9qcklBaey3nHEu
	jPGG8vetSnBEGOLWRDoVag6cB5rQXQSLQn1IGYZvO3IXvd+VPOQHdAVB5LdoYWQi2cxUtA
	9quNR1ioA5EOLYD0XOnf7ljEAAvF2us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-fdv95TynM-SZC3bHF_ZjFQ-1; Thu, 29 Apr 2021 22:14:20 -0400
X-MC-Unique: fdv95TynM-SZC3bHF_ZjFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C258186E8;
	Fri, 30 Apr 2021 02:14:19 +0000 (UTC)
Received: from [10.72.12.188] (ovpn-12-188.pek2.redhat.com [10.72.12.188])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F2E617177;
	Fri, 30 Apr 2021 02:14:13 +0000 (UTC)
Subject: Re: [PATCH] nbd: provide a way for userspace processes to identify
 device backends
To: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, josef@toxicpanda.com,
 axboe@kernel.dk, idryomov@redhat.com
References: <20210429102828.31248-1-prasanna.kalever@redhat.com>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <a1c36274-954f-198e-d221-ea4d092aee6e@redhat.com>
Date: Fri, 30 Apr 2021 10:14:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429102828.31248-1-prasanna.kalever@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-EIJOSRGO7K.A.D_E.3-2igB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1149
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a1c36274-954f-198e-d221-ea4d092aee6e@redhat.com
Resent-Date: Fri, 30 Apr 2021 02:47:19 +0000 (UTC)

On 2021/4/29 18:28, Prasanna Kumar Kalever wrote:
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
>
> Signed-off-by: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> ---
>   drivers/block/nbd.c              | 60 +++++++++++++++++++++++++++++++-
>   include/uapi/linux/nbd-netlink.h |  1 +
>   2 files changed, 60 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 4ff71b579cfc..b5022187ad9c 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -79,6 +79,7 @@ struct link_dead_args {
>   #define NBD_RT_HAS_CONFIG_REF		4
>   #define NBD_RT_BOUND			5
>   #define NBD_RT_DISCONNECT_ON_CLOSE	6
> +#define NBD_RT_HAS_BACKEND_FILE		7
>   
>   #define NBD_DESTROY_ON_DISCONNECT	0
>   #define NBD_DISCONNECT_REQUESTED	1
> @@ -119,6 +120,8 @@ struct nbd_device {
>   
>   	struct completion *destroy_complete;
>   	unsigned long flags;
> +
> +	char *backend;
>   };
>   
>   #define NBD_CMD_REQUEUED	1
> @@ -216,6 +219,20 @@ static const struct device_attribute pid_attr = {
>   	.show = pid_show,
>   };
>   
> +static ssize_t backend_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct gendisk *disk = dev_to_disk(dev);
> +	struct nbd_device *nbd = (struct nbd_device *)disk->private_data;
> +
> +	return sprintf(buf, "%s\n", nbd->backend ?: "");
> +}
> +
> +static const struct device_attribute backend_attr = {
> +	.attr = { .name = "backend", .mode = 0444},
> +	.show = backend_show,
> +};
> +
>   static void nbd_dev_remove(struct nbd_device *nbd)
>   {
>   	struct gendisk *disk = nbd->disk;
> @@ -1215,6 +1232,12 @@ static void nbd_config_put(struct nbd_device *nbd)
>   				       &config->runtime_flags))
>   			device_remove_file(disk_to_dev(nbd->disk), &pid_attr);
>   		nbd->task_recv = NULL;
> +		if (test_and_clear_bit(NBD_RT_HAS_BACKEND_FILE,
> +				       &config->runtime_flags)) {
> +			device_remove_file(disk_to_dev(nbd->disk), &backend_attr);
> +			kfree(nbd->backend);
> +			nbd->backend = NULL;
> +		}
>   		nbd_clear_sock(nbd);
>   		if (config->num_connections) {
>   			int i;
> @@ -1274,7 +1297,7 @@ static int nbd_start_device(struct nbd_device *nbd)
>   
>   	error = device_create_file(disk_to_dev(nbd->disk), &pid_attr);
>   	if (error) {
> -		dev_err(disk_to_dev(nbd->disk), "device_create_file failed!\n");
> +		dev_err(disk_to_dev(nbd->disk), "device_create_file failed for pid!\n");
>   		return error;
>   	}
>   	set_bit(NBD_RT_HAS_PID_FILE, &config->runtime_flags);
> @@ -1681,6 +1704,7 @@ static int nbd_dev_add(int index)
>   		BLK_MQ_F_BLOCKING;
>   	nbd->tag_set.driver_data = nbd;
>   	nbd->destroy_complete = NULL;
> +	nbd->backend = NULL;
>   
>   	err = blk_mq_alloc_tag_set(&nbd->tag_set);
>   	if (err)
> @@ -1754,6 +1778,7 @@ static const struct nla_policy nbd_attr_policy[NBD_ATTR_MAX + 1] = {
>   	[NBD_ATTR_SOCKETS]		=	{ .type = NLA_NESTED},
>   	[NBD_ATTR_DEAD_CONN_TIMEOUT]	=	{ .type = NLA_U64 },
>   	[NBD_ATTR_DEVICE_LIST]		=	{ .type = NLA_NESTED},
> +	[NBD_ATTR_BACKEND_IDENTIFIER]	=	{ .type = NLA_STRING},
>   };
>   
>   static const struct nla_policy nbd_sock_policy[NBD_SOCK_MAX + 1] = {
> @@ -1956,6 +1981,23 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
>   		}
>   	}
>   	ret = nbd_start_device(nbd);
> +	if (ret)
> +		goto out;
> +	if (info->attrs[NBD_ATTR_BACKEND_IDENTIFIER]) {
> +		nbd->backend = nla_strdup(info->attrs[NBD_ATTR_BACKEND_IDENTIFIER],
> +					  GFP_KERNEL);
> +		if (!nbd->backend) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +	}
> +	ret = device_create_file(disk_to_dev(nbd->disk), &backend_attr);
> +	if (ret) {
> +		dev_err(disk_to_dev(nbd->disk),
> +			"device_create_file failed for backend!\n");
> +		goto out;
> +	}
> +	set_bit(NBD_RT_HAS_BACKEND_FILE, &config->runtime_flags);
>   out:
>   	mutex_unlock(&nbd->config_lock);
>   	if (!ret) {
> @@ -2048,6 +2090,22 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
>   		       index);
>   		return -EINVAL;
>   	}
> +	if (nbd->backend) {
> +		if (info->attrs[NBD_ATTR_BACKEND_IDENTIFIER]) {
> +			if (nla_strcmp(info->attrs[NBD_ATTR_BACKEND_IDENTIFIER],
> +				       nbd->backend)) {
> +				mutex_unlock(&nbd_index_mutex);
> +				dev_err(nbd_to_dev(nbd),
> +					"backend image doesn't match with %s\n",
> +					nbd->backend);
> +				return -EINVAL;
> +			}
> +		} else {
> +			mutex_unlock(&nbd_index_mutex);
> +			dev_err(nbd_to_dev(nbd), "must specify backend\n");
> +			return -EINVAL;
> +		}
> +	}
>   	if (!refcount_inc_not_zero(&nbd->refs)) {
>   		mutex_unlock(&nbd_index_mutex);
>   		printk(KERN_ERR "nbd: device at index %d is going down\n",
> diff --git a/include/uapi/linux/nbd-netlink.h b/include/uapi/linux/nbd-netlink.h
> index c5d0ef7aa7d5..2d0b90964227 100644
> --- a/include/uapi/linux/nbd-netlink.h
> +++ b/include/uapi/linux/nbd-netlink.h
> @@ -35,6 +35,7 @@ enum {
>   	NBD_ATTR_SOCKETS,
>   	NBD_ATTR_DEAD_CONN_TIMEOUT,
>   	NBD_ATTR_DEVICE_LIST,
> +	NBD_ATTR_BACKEND_IDENTIFIER,
>   	__NBD_ATTR_MAX,
>   };
>   #define NBD_ATTR_MAX (__NBD_ATTR_MAX - 1)

Reviewed-by: Xiubo Li <xiubli@redhat.com>

